import 'package:flutter/cupertino.dart';
import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'girls-plover',
      description: 'A girls-plover - it is pretty!',
      price: 129.99,
      imageUrl: 'assets/images/girls-plover.jpg',
    ),
    Product(
      id: 'p2',
      title: 'girls wear',
      description: 'A nice girls wear.',
      price: 69.99,
      imageUrl: 'assets/images/girls.jpg',
    ),
    Product(
      id: 'p3',
      title: 'New jackets',
      description: 'Worm and cozy - exactly what you need for the winter.',
      price: 119.99,
      imageUrl: 'assets/images/jackets.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Plover',
      description: 'Thats Exactly you want.',
      price: 89.99,
      imageUrl: 'assets/images/plover.jpg',
    ),
    Product(
      id: 'p5',
      title: 'shirt-half',
      description: 'Summer is comming',
      price: 59.99,
      imageUrl: 'assets/images/shirt-half.jpg',
    ),
    Product(
      id: 'p6',
      title: 'New Shirt',
      description: 'Every one need this.',
      price: 39.99,
      imageUrl: 'assets/images/shirt.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Shoes',
      description: 'You shoud Like that.',
      price: 80.99,
      imageUrl: 'assets/images/shoes.jpg',
    ),
    Product(
      id: 'p8',
      title: 't-shirt cotton',
      description: 'Sweet and comforatble',
      price: 49.99,
      imageUrl: 'assets/images/t-shirt-cotton.jpg',
    ),
    Product(
      id: 'p9',
      title: 'winter shirt',
      description: 'Be prepared for winter.',
      price: 60.99,
      imageUrl: 'assets/images/winter-shirt.jpg',
    ),
    Product(
      id: 'p10',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl: 'assets/images/Trousers.jpg',
    )
  ];

  Product findByID(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    notifyListeners();
  }
}
