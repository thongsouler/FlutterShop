import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testnew/providers/oder.dart';

class OrderItemList extends StatelessWidget {
  final OrderItem order;

  const OrderItemList({@required this.order});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(order.id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(Icons.delete),
        ),
        onDismissed: (direction) {
          Provider.of<Orders>(context, listen: false).deleteOrder(order);
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                ListTile(
                  title: Text('Total: ${order.amount}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.expand_more),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
