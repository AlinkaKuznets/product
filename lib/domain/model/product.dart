class Product {
  const Product({
    required this.name,
    required this.image,
    required this.price,
    required this.categoryId,
    required this.ingredients,
    required this.subCategoryId,
  });

  final String name;
  final String image;
  final double price;
  final String categoryId;
  final List<String> ingredients;
  final String subCategoryId;
}

