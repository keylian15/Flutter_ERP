import 'package:flutter/material.dart';
import '../services/cart_manager.dart';
import '../screens/article_detail_page.dart';
import '../screens/cart_page.dart';

class ArticleCard extends StatelessWidget {
  final Map<String, dynamic> article;
  final CartManager cartManager;
  final VoidCallback onCartUpdated;

  const ArticleCard({
    Key? key,
    required this.article,
    required this.cartManager,
    required this.onCartUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(
                article: article,
                cartManager: cartManager,
                onCartUpdated: onCartUpdated,
              ),
            ),
          );
        },
        child: Row(
          children: [
            // Image de l'article
            SizedBox(
              width: 100,
              height: 100,
              child: article['image'] != null && article['image'].toString().isNotEmpty
                  ? Image.network(
                article['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 50);
                },
              )
                  : const Icon(Icons.image_not_supported, size: 50),
            ),
            // Informations de l'article
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article['name'] ?? 'Sans titre',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Prix: ${article['price'] ?? 'N/A'} €'),
                    if (article['description'] != null && article['description'].toString().trim().isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          article['description'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Bouton pour ajouter au panier
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
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
            ),
          ],
        ),
      ),
    );
  }
}