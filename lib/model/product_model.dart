class ProductModel {
  final int id;
  final String name;
  final double price;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      description: json['description'] ?? '',
    );
  }
}
