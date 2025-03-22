import 'package:flutter/material.dart';
import '../services/cart_manager.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  final CartManager cartManager;

  const CartPage({Key? key, required this.cartManager}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Panier'),
        actions: [
          if (widget.cartManager.itemCount > 0)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Vider le panier'),
                    content: const Text(
                        'Êtes-vous sûr de vouloir vider votre panier ?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            widget.cartManager.clear();
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Vider'),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      body: widget.cartManager.itemCount == 0
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Votre panier est vide', style: TextStyle(fontSize: 18)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartManager.items.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartManager.items[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // Image
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: item.image.isNotEmpty
                                    ? Image.network(
                                        item.image,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(
                                              Icons.image_not_supported,
                                              size: 40);
                                        },
                                      )
                                    : const Icon(Icons.image_not_supported,
                                        size: 40),
                              ),
                              const SizedBox(width: 12),
                              // Informations
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                        'Prix unitaire: ${item.price.toStringAsFixed(2)} €'),
                                    Text(
                                      'Total: ${item.total.toStringAsFixed(2)} €',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              // Contrôles de quantité
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                        onPressed: () {
                                          setState(() {
                                            widget.cartManager
                                                .decreaseQuantity(item.id);
                                          });
                                        },
                                      ),
                                      Text(
                                        '${item.quantity}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                            Icons.add_circle_outline),
                                        onPressed: () {
                                          setState(() {
                                            widget.cartManager
                                                .increaseQuantity(item.id);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        widget.cartManager.removeItem(item.id);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Résumé du panier
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.cartManager.totalPrice.toStringAsFixed(2)} €',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutPage(cartManager: widget.cartManager),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Commander',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
