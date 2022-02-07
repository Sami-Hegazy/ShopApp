import 'package:flutter/cupertino.dart';
import 'product.dart';

class Products with ChangeNotifier {
  final List<ProductModel> _items = [
    ProductModel(
      id: 'p1',
      title: 'girls-plover',
      description: 'A girls-plover - it is pretty!',
      price: 129.99,
      imageUrl: 'assets/images/girls-plover.jpg',
    ),
    ProductModel(
      id: 'p2',
      title: 'girls wear',
      description: 'A nice girls wear.',
      price: 69.99,
      imageUrl: 'assets/images/girls.jpg',
    ),
    ProductModel(
      id: 'p3',
      title: 'New jackets',
      description: 'Worm and cozy - exactly what you need for the winter.',
      price: 119.99,
      imageUrl: 'assets/images/jackets.jpg',
    ),
    ProductModel(
      id: 'p4',
      title: 'Plover',
      description: 'Thats Exactly you want.',
      price: 89.99,
      imageUrl: 'assets/images/plover.jpg',
    ),
    ProductModel(
      id: 'p5',
      title: 'shirt-half',
      description: 'Summer is comming',
      price: 59.99,
      imageUrl: 'assets/images/shirt-half.jpg',
    ),
    ProductModel(
      id: 'p6',
      title: 'New Shirt',
      description: 'Every one need this.',
      price: 39.99,
      imageUrl: 'assets/images/shirt.jpg',
    ),
    ProductModel(
      id: 'p7',
      title: 'Shoes',
      description: 'You shoud Like that.',
      price: 80.99,
      imageUrl: 'assets/images/shoes.jpg',
    ),
    ProductModel(
      id: 'p8',
      title: 't-shirt cotton',
      description: 'Sweet and comforatble',
      price: 49.99,
      imageUrl: 'assets/images/t-shirt-cotton.jpg',
    ),
    ProductModel(
      id: 'p9',
      title: 'winter shirt',
      description: 'Be prepared for winter.',
      price: 60.99,
      imageUrl: 'assets/images/winter-shirt.jpg',
    ),
    ProductModel(
      id: 'p10',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl: 'assets/images/Trousers.jpg',
    )
  ];
  List<ProductModel> get items {
    return [..._items];
  }

  ProductModel findByID(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<ProductModel> get favoriteItems {
    return _items.where((element) => element.isFavourite).toList();
  }

  void addProduct(ProductModel product) {
    final newProduct = ProductModel(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct);
    notifyListeners();
  }

  void updateProduct(String id, ProductModel newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      // ignore: avoid_print
      print('....x');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
