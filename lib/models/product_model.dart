class Product {
  final int id;
  final int brandId;
  final String productName;
  final int offerPrice;
  final int price;
  final String description;
  final int status;
  final String createdAt;
  final String updatedAt;
  final String images;

  Product({
    required this.id,
    required this.brandId,
    required this.productName,
    required this.offerPrice,
    required this.price,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      brandId: json['brand_id'],
      productName: json['product_name'],
      offerPrice: json['offer_price'],
      price: json['price'],
      description: json['description'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      images: json['images'],
    );
  }
}

// Usage example:

void main() {
  // Replace this with your actual JSON data
  Map<String, dynamic> jsonData = {
    // ... your JSON data ...
  };

  // Parse the JSON data into a list of Product objects
  List<Product> products = List.from(jsonData['product'] ?? [])
      .map((productJson) => Product.fromJson(productJson))
      .toList();

  // Now you have a list of Product objects
  for (var product in products) {
    print(product.productName);
  }
}
