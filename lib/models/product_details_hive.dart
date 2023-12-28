import 'package:hive/hive.dart';

part 'product_details_hive.g.dart'; // Updated file name

@HiveType(typeId: 1)
class ProductDetailHive extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int brandId;

  @HiveField(2)
  final String productName;

  @HiveField(3)
  final int offerPrice;

  @HiveField(4)
  final int price;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final int status;

  @HiveField(7)
  final String createdAt;

  @HiveField(8)
  final String updatedAt;

  @HiveField(9)
  final int catId;

  @HiveField(10)
  final List<String> images;

  ProductDetailHive({
    required this.id,
    required this.brandId,
    required this.productName,
    required this.offerPrice,
    required this.price,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.catId,
    required this.images,
  });


  factory ProductDetailHive.fromJson(Map<String, dynamic> json) {
    return ProductDetailHive(
      id: json['id'],
      brandId: json['brand_id'],
      productName: json['product_name'],
      offerPrice: json['offer_price'],
      price: json['price'],
      description: json['description'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      catId: json['cat_id'],
      images: List<String>.from(json['images'] ?? []),
    );
  }
}

