import 'package:flutter/material.dart';
import '../services/cart_manager.dart';
import '../widgets/article_card.dart';
import '../api/api_service.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> articles = [];
  List<dynamic> fournisseurs = [];
  String currentFournisseurId = "";
  String currentFournisseurName = "";
  String currentStudentName = "";
  bool isLoading = true;
  final CartManager cartManager = CartManager();

  @override
  void initState() {
    super.initState();
    _fetchFournisseurs();
  }

  Future<void> _fetchFournisseurs() async {
    setState(() {
      isLoading = true;
    });

    try {
      final data = await ApiService.fetchFournisseurs();
      setState(() {
        fournisseurs = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorMessage('Impossible de charger les fournisseurs');
    }
  }

  Future<void> _fetchArticles(String fournisseurId) async {
    setState(() {
      isLoading = true;
    });

    try {
      final data = await ApiService.fetchArticles(fournisseurId);
      setState(() {
        articles = data;
        currentFournisseurId = fournisseurId;

        // Trouver le nom du fournisseur et de l'étudiant
        for (var fournisseur in fournisseurs) {
          if (fournisseur['id'].toString() == fournisseurId) {
            currentFournisseurName = fournisseur['name'] ?? 'Fournisseur';
            currentStudentName = fournisseur['student'] ?? '';
            break;
          }
        }

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorMessage('Impossible de charger les articles');
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartManager: cartManager),
      ),
    ).then((_) {
      // Rafraîchir l'interface lorsque l'utilisateur revient du panier
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boutique IUT'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: _openCart,
              ),
              if (cartManager.totalQuantity > 0)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${cartManager.totalQuantity}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          // Bandeau des fournisseurs
          Container(
            height: 120,  // Augmenté pour accommoder deux lignes de texte
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fournisseurs.length,
              itemBuilder: (context, index) {
                final fournisseur = fournisseurs[index];
                final isSelected = currentFournisseurId == fournisseur['id'].toString();

                // Utiliser le nom du fournisseur pour les initiales
                final String initials = fournisseur['name'] != null && fournisseur['name'].toString().isNotEmpty
                    ? (fournisseur['name'].toString().length >= 2
                    ? fournisseur['name'].toString().substring(0, 2).toUpperCase()
                    : fournisseur['name'].toString().toUpperCase())
                    : "??";

                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      _fetchArticles(fournisseur['id'].toString());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: isSelected ? Colors.blue : Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.white,
                              child: Text(
                                initials,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.blue : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          fournisseur['name'] ?? "",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Ajout du nom de l'étudiant sous le nom du fournisseur
                        Text(
                          fournisseur['student'] ?? "",
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[700],
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Titre de la section articles
          if (currentFournisseurId.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Articles de $currentFournisseurName',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (currentStudentName.isNotEmpty)
                    Text(
                      'Étudiant: $currentStudentName',
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
            ),

          // Liste des articles
          Expanded(
            child: currentFournisseurId.isEmpty
                ? const Center(
              child: Text('Sélectionnez un fournisseur pour voir ses articles'),
            )
                : articles.isEmpty
                ? const Center(
              child: Text('Aucun article trouvé pour ce fournisseur'),
            )
                : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ArticleCard(
                  article: article,
                  cartManager: cartManager,
                  onCartUpdated: () => setState(() {}),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}