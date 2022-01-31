import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

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
        title: const Text('MyShop'),
        centerTitle: true,
      ),
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
