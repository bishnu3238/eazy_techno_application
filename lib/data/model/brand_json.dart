import '../../domain/entities/entities.dart';
import '../../app_constants/app_constant.dart';


class BrandJson {
  final String id;
  final String brandName;
  final String image;
  final String status;
  final String time;
  final String date;

  const BrandJson({
    required this.id,
    required this.brandName,
    required this.image,
    required this.status,
    required this.time,
    required this.date,
  });

  factory BrandJson.fromMap(Map<String, dynamic> json) {
    return BrandJson(
      id: json['id'] as String,
      brandName: json['sub_category_name'] as String,
      image: "$brandImgDir/${json['image']}",
      status: json['status'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
    );
  }

  Brands toDomain() => Brands(
      id: id,
      brandName: brandName,
      image: image,
      status: status,
      time: time,
      date: DateTime.parse(date));
}
