import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<ProductModel> _items = [];
  List<ProductModel> get items {
    return [..._items];
  }

  ProductModel findByID(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<ProductModel> get favoriteItems {
    return _items.where((element) => element.isFavourite).toList();
  }

  Future<void> fetchAndSetProducts() async {
    const url =
        'https://my-shop-185b2-default-rtdb.firebaseio.com/pages/products.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      final List<ProductModel> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(
          ProductModel(
              id: prodId,
              title: prodData['title'],
              description: prodData['description'],
              price: prodData['price'],
              imageUrl: prodData['imageUrl'],
              isFavourite: prodData['isFavourite']),
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addProduct(ProductModel product) async {
    const url =
        'https://my-shop-185b2-default-rtdb.firebaseio.com/pages/products.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavourite': product.isFavourite,
        }),
      );
      final newProduct = ProductModel(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct);
      notifyListeners();
    } catch (error) {
      // ignore: avoid_print
      print(error);
      rethrow;
    }
  }

  Future<void> updateProduct(String id, ProductModel newProduct) async {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      final url =
          'https://my-shop-185b2-default-rtdb.firebaseio.com/pages/products/$id.json';
      await http.patch(Uri.parse(url),
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      // ignore: avoid_print
      print('....x');
    }
  }

  void deleteProduct(String id) {
    final url =
        'https://my-shop-185b2-default-rtdb.firebaseio.com/pages/products/$id.json';
    final existingProdutIndex =
        _items.indexWhere((element) => element.id == id);
    ProductModel? existingProduct = _items[existingProdutIndex];

    http.delete(Uri.parse(url)).then((response) {
      if (response.statusCode >= 400) {
        throw Exception();
      }
      existingProduct = null;
    }).catchError((_) {
      _items.insert(existingProdutIndex, existingProduct!);
      notifyListeners();
    });
    _items.removeAt(existingProdutIndex);
    notifyListeners();
  }
}
