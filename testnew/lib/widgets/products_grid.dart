import 'package:flutter/material.dart';
import 'package:testnew/providers/product.dart';
import 'package:testnew/providers/products.dart';
import 'package:testnew/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFav;

  const ProductsGrid({@required this.isFav});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =
        isFav ? productData.listFavoriteProduct() : productData.items;
    return Container(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: products.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: products[index],
              child: ProductItem(
                  // products[index].id,
                  // products[index].title,
                  // products[index].imageUrl,
                  )),
        ));
  }
}
