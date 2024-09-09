import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/domain/model/product.dart';

class ProductsCubit extends Cubit<ProductsState> {
  static const _productsData = [
    Product(
        name: 'Мяу',
        image: 'assets/images/Cat-1.jpeg',
        price: 100.50,
        categoryId: 'c1',
        ingredients: ['1 cat', '1 happy house', '1 joy', '2 awkwardness'],
        subCategoryId: 'a1'),
    Product(
        name: 'МЯУ',
        image: 'assets/images/Cat-2.jpeg',
        price: 200,
        categoryId: 'c2',
        ingredients: ['1 cat', '28 stabs', '3 rage'],
        subCategoryId: 'a1'),
    Product(
        name: 'Error',
        image: 'assets/images/Cat-3.jpeg',
        price: 255.5,
        categoryId: 'c3',
        ingredients: ['9 misunderstanding', 'stupor', '1 sadness'],
        subCategoryId: 'a1'),
    Product(
        name: 'Ам',
        image: 'assets/images/Cat-4.jpeg',
        price: 15,
        categoryId: 'c4',
        ingredients: ['Am', 'Ewewe', 'AAAAAAA'],
        subCategoryId: 'a2'),
    Product(
        name: 'Мяу',
        image: 'assets/images/Cat-5.jpeg',
        price: 3,
        categoryId: 'c5',
        ingredients: ['4 misunderstanding', '2 contempt'],
        subCategoryId: 'a2'),
    Product(
        name: 'Мяу',
        image: 'assets/images/Cat-6.jpeg',
        price: 5000,
        categoryId: 'c4',
        ingredients: ['It\'s me'],
        subCategoryId: 'a2'),
    Product(
      name: 'Мяу',
      image: 'assets/images/Cat-7.jpeg',
      price: 77.9,
      categoryId: 'c5',
      ingredients: ['13 femininity vibe', '1 interest'],
      subCategoryId: 'a3',
    ),
    Product(
        name: 'Мяу',
        image: 'assets/images/Cat-8.jpeg',
        price: 98.1,
        categoryId: 'c3',
        ingredients: ['It\'s you'],
        subCategoryId: 'a3'),
    Product(
        name: 'Мяу',
        image: 'assets/images/Cat-9.jpeg',
        price: 35.6,
        categoryId: 'c2',
        ingredients: ['O'],
        subCategoryId: 'a3'),
    Product(
      name: 'Мяу',
      image: 'assets/images/Cat-10.jpeg',
      price: 8,
      categoryId: 'c1',
      ingredients: [
        'Pain',
        'Pain',
        'Pain',
        'Pain',
        'Pain',
        'Pain',
        'Pain',
      ],
      subCategoryId: 'a1',
    ),
  ];

  ProductsCubit() : super(ProductsState(data: _productsData));

  void loadData({
    required List<String> cat,
    required List<String> subCat,
  }) {
    List<Product> data;

    if (cat.isEmpty) {
      data = _productsData;
    } else {
      data = _productsData.where((e) => cat.contains(e.categoryId)).toList();
    }
    if (subCat.isNotEmpty) {
      data = data.where((e) => subCat.contains(e.subCategoryId)).toList();
    }

    emit(ProductsState(data: data));
  }
}

class ProductsState {
  final List<Product> data;

  ProductsState({required this.data});
}
