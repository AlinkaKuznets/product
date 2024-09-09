import 'package:flutter/material.dart';
import 'package:product/product_screen.dart';
import 'package:product/domain/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  void selectProduct(BuildContext context, Product product) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => ProductScreen(product: product)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(167, 71, 71, 71),
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () {
          selectProduct(context, product);
        },
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        product.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${product.price.toStringAsFixed(2)} ₽',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
