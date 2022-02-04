import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/bage.dart';
import '../widgets/products_grid.dart';
import 'dart:math' as math;

enum FilterOption { favorite, all }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('MyShop'),
            Consumer<Cart>(
              builder: (_, cart, chi) => Badge(
                child: chi as Widget,
                value: cart.itemCount.toString(),
                color: Colors.red,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routName);
                },
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return Transform.rotate(
            angle: 50 * math.pi / 180,
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.remove_red_eye,
              ),
            ),
          );
        }),
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(showOnlyFavs: _showOnlyFavorite),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: FilterOption.favorite,
              child: Text(
                "Only Favorite",
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const PopupMenuItem(
              value: FilterOption.all,
              child: Text(
                "Show All",
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          icon: const Icon(Icons.more_vert),
          offset: const Offset(0, 100),
          onSelected: (FilterOption selectVal) {
            setState(() {
              if (selectVal == FilterOption.favorite) {
                _showOnlyFavorite = true;
              } else {
                _showOnlyFavorite = false;
              }
            });
          },
        ),
        onPressed: () {},
      ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
