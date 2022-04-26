import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testnew/providers/cart.dart';
import 'package:testnew/providers/product.dart';
import 'package:testnew/screens/cart_creen.dart';
import 'package:testnew/widgets/app_drawer.dart';
import 'package:testnew/widgets/badge.dart';
import 'package:testnew/widgets/product_item.dart';
import 'package:testnew/widgets/products_grid.dart';

enum FilterOption {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/products-overview';
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    print('build overvire screen');
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Product Overview'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOption value) {
                setState(() {
                  if (value == FilterOption.favorites) {
                    //show only favorites products
                    isFav = true;
                  } else {
                    //Show all product
                    isFav = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOption.favorites,
                      child: Text('Favorites Products'),
                    ),
                    const PopupMenuItem(
                      value: FilterOption.all,
                      child: Text('All Products'),
                    )
                  ]),
          Consumer<Cart>(
              builder: (context, value, child) => Badge(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CartScreen.routeName);
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  value: cart.getItemCount().toString()))
        ],
      ),
      body: ProductsGrid(
        isFav: isFav,
      ),
    );
  }
}
