import 'package:flutter/material.dart';
import 'package:product/domain/model/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            product.image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Ingridients:',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          for (final ingredients in product.ingredients)
            Text(
              ingredients,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Price: ${product.price}',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
