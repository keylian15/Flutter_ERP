import '../models/cart_item.dart';

class CartManager {
  static final CartManager _instance = CartManager._internal();

  factory CartManager() {
    return _instance;
  }

  CartManager._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  int get totalQuantity {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.total);
  }

  void addItem(Map<String, dynamic> articleData) {
    final String id = articleData['id'].toString();
    final existingItemIndex = _items.indexWhere((item) => item.id == id);

    if (existingItemIndex >= 0) {
      // L'article existe déjà dans le panier
      _items[existingItemIndex].quantity += 1;
    } else {
      // Nouvel article
      final double price = double.tryParse(articleData['price'].toString()) ?? 0.0;
      _items.add(CartItem(
        id: id,
        name: articleData['name'] ?? 'Produit sans nom',
        price: price,
        image: articleData['image'] ?? '',
      ));
    }
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
  }

  void decreaseQuantity(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity -= 1;
      } else {
        _items.removeAt(index);
      }
    }
  }

  void increaseQuantity(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _items[index].quantity += 1;
    }
  }

  void clear() {
    _items.clear();
  }
}