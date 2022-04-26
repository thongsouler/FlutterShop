import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Hello user'),
        leading: Icon(
          Icons.shopping_bag,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products-overview');
            },
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Order'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/order');
              })
        ],
      ),
    ));
  }
}
