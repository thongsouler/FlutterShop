import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({this.id, this.title, this.price, this.quantity});
}

class Cart extends ChangeNotifier {
  Map<String, CartItem> _items = {};

  //getter
  Map<String, CartItem> get items {
    return {..._items};
  }

  int getItemCount() {
    return _items.length;
  }

  double totalAmount() {
    double total = 0.0;
    _items.forEach((productId, product) {
      total += product.price * product.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    //Neu da co
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingProduct) => CartItem(
              id: existingProduct.id,
              price: existingProduct.price,
              title: existingProduct.title,
              quantity: existingProduct.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              price: price,
              title: title,
              quantity: 1));
    }
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (existingProduct) => CartItem(
              id: existingProduct.id,
              price: existingProduct.price,
              title: existingProduct.title,
              quantity: existingProduct.quantity - 1));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
