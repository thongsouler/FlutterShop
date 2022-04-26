import 'package:flutter/cupertino.dart';
import 'package:testnew/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime time;

  OrderItem(this.id, this.amount, this.products, this.time);
}

class Orders extends ChangeNotifier {
  List<OrderItem> _orders = [];
  //getter
  List<OrderItem> get oders {
    return [..._orders];
  }

  void addOrder(List<CartItem> products, double amount) {
    _orders.insert(0,
        OrderItem(DateTime.now().toString(), amount, products, DateTime.now()));
    notifyListeners();
  }

  void deleteOrder(OrderItem order) {
    _orders.remove(order);
    notifyListeners();
  }
}
