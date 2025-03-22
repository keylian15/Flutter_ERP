import 'package:flutter/material.dart';
import '../services/cart_manager.dart';
import 'cart_page.dart';

class ArticleDetailPage extends StatelessWidget {
  final Map<String, dynamic> article;
  final CartManager cartManager;
  final VoidCallback onCartUpdated;

  const ArticleDetailPage({
    Key? key,
    required this.article,
    required this.cartManager,
    required this.onCartUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['name'] ?? 'Détail de l\'article'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(cartManager: cartManager),
                    ),
                  ).then((_) => onCartUpdated());
                },
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image de l'article
            SizedBox(
              width: double.infinity,
              height: 250,
              child: article['image'] != null && article['image'].toString().isNotEmpty
                  ? Image.network(
                article['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.image_not_supported, size: 100),
                  );
                },
              )
                  : const Center(
                child: Icon(Icons.image_not_supported, size: 100),
              ),
            ),
            // Informations détaillées de l'article
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article['name'] ?? 'Sans titre',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Référence: ${article['id'] ?? 'N/A'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Prix: ${article['price'] ?? 'N/A'} €',
                    style: const TextStyle(fontSize: 16),
                  ),
                  if (article['description'] != null && article['description'].toString().trim().isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Description: ${article['description']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        cartManager.addItem(article);
                        onCartUpdated();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${article['name']} ajouté au panier'),
                            duration: const Duration(seconds: 1),
                            action: SnackBarAction(
                              label: 'Voir le panier',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartPage(cartManager: cartManager),
                                  ),
                                ).then((_) => onCartUpdated());
                              },
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Ajouter au panier'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}