import 'package:flutter/material.dart';
import 'package:product/domain/model/category_product.dart';

var k1ColorFon = Colors.black;
var k1ColorText = const Color.fromARGB(255, 120, 120, 120);
var k2ColorFon = Colors.amber;
var k2ColorText = Colors.black;

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final CategoryProduct title;
  final Function() onTap;

  const CategoryItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? k2ColorFon : k1ColorFon,
        foregroundColor: isSelected ? k2ColorText : k1ColorText,
      ),
      child: Text(
        title.title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
