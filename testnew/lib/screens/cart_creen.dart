import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testnew/providers/cart.dart';
import 'package:testnew/providers/oder.dart';
import 'package:testnew/widgets/cart_item_list.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  const Text('Total'),
                  Spacer(),
                  Chip(label: Text('\$ ${cart.totalAmount()}')),
                  TextButton(
                    onPressed: () {
                      print('OrderNow');

                      ///Order CartList and Go to OrderScreen
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount());
                      cart.clear();
                    },
                    child: const Text('ORDER'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.getItemCount(),
                  itemBuilder: (context, index) => CartItemList(
                        id: cart.items.values.toList()[index].id,
                        productId: cart.items.keys.toList()[index],
                        price: cart.items.values.toList()[index].price,
                        quantity: cart.items.values.toList()[index].quantity,
                        title: cart.items.values.toList()[index].title,
                      )))
        ],
      ),
    );
  }
}
