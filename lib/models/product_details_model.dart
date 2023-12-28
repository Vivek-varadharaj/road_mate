// class ProductDetail {
//   final int id;
//   final int brandId;
//   final String productName;
//   final int offerPrice;
//   final int price;
//   final String description;
//   final int status;
//   final String createdAt;
//   final String updatedAt;
//   final int catId;
//   final List<String> images;

//   ProductDetail({
//     required this.id,
//     required this.brandId,
//     required this.productName,
//     required this.offerPrice,
//     required this.price,
//     required this.description,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.catId,
//     required this.images,
//   });

//   factory ProductDetail.fromJson(Map<String, dynamic> json) {
//     return ProductDetail(
//       id: json['id'],
//       brandId: json['brand_id'],
//       productName: json['product_name'],
//       offerPrice: json['offer_price'],
//       price: json['price'],
//       description: json['description'],
//       status: json['status'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       catId: json['cat_id'],
//       images: List<String>.from(json['images'] ?? []),
//     );
//   }
// }


