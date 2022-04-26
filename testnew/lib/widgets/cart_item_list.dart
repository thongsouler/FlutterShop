import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  const CartItemList(
      {@required this.id,
      @required this.productId,
      @required this.title,
      @required this.price,
      @required this.quantity});

  @override
  Widget build(BuildContext context) {
    final double totalAmount = price * quantity;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Icon(Icons.task),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text('Total: ${totalAmount}')
              ],
            ),
            Spacer(),
            Text('$quantity x')
          ],
        ),
      ),
    );
  }
}
