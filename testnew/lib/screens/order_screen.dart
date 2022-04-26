import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testnew/providers/oder.dart';
import 'package:testnew/screens/products_overview_screen.dart';
import 'package:testnew/widgets/app_drawer.dart';
import 'package:testnew/widgets/order_item_list.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: ListView.builder(
          itemCount: orderData.oders.length,
          itemBuilder: (context, index) => OrderItemList(
                order: orderData.oders[index],
              )),
    );
  }
}
