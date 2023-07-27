import '../../app_constants/app_constant.dart';
import '../../domain/entities/items.dart';

class ItemsJson {
  final String id;
  final dynamic menuName;
  final String categoryId;
  final String subCategoryId;
  final String title;
  final String subTitle;
  final String description;
  final String price;
  final String quantity;
  final String discount;
  final String finalPrice;
  final String image;
  final String bestSeller;
  final String rating;
  final String offerPeriod;
  final String status;
  final String time;
  final String date;

  ItemsJson({
    required this.id,
    required this.menuName,
    required this.categoryId,
    required this.subCategoryId,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.finalPrice,
    required this.image,
    required this.bestSeller,
    required this.rating,
    required this.offerPeriod,
    required this.status,
    required this.time,
    required this.date,
  });

  factory ItemsJson.fromJson(Map<String, dynamic> json) {
    return ItemsJson(
      id: json['id'] as String,
      menuName: json['menu_type'] as dynamic,
      categoryId: json['category_id'] as String,
      subCategoryId: json['sub_category_id'] as String,
      title: json['title'] as String,
      subTitle: json['sub_title'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      quantity: json['quantity'] as String,
      discount: json['discount'] as String,
      finalPrice: json['final_price'] as String,
      image: json['image'] as String,
      bestSeller: json['best_seller'] as String,
      rating: json['rating'] as String,
      offerPeriod: json['offer_period'] as String,
      status: json['status'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
    );
  }

  Items toDomain() => Items(
      id: id,
      menuName: menuName,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      title: title,
      subTitle: subTitle,
      description: description,
      price: price,
      quantity: quantity,
      discount: discount,
      finalPrice: finalPrice,
      image: '$itemImgDir/${image.split(".")[0]}/$image',
      bestSeller: bestSeller,
      rating: rating,
      offerPeriod: offerPeriod,
      status: status,
      time: time,
      date: DateTime.parse(date));
}
