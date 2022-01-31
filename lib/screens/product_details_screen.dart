import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; //is the id
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findByID(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}