import 'package:flutter/material.dart';
import 'package:product/products_list_screen.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 4, 4, 4));

void main() {
  runApp(
    MaterialApp(
      home: const ProductsListScreen(),
      theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ),
  );
}
