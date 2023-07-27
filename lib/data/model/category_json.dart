import '../../domain/entities/categories.dart';
const categoryImgDir = "https://eazytechno.com/biocellar/admin/category_images";

class CategoryJson {
  final String id;
  final String categoryName;
  final String image;
  final String status;
  final String time;
  final String date;

  const CategoryJson({
    required this.id,
    required this.categoryName,
    required this.image,
    required this.status,
    required this.time,
    required this.date,
  });

  factory CategoryJson.fromJson(Map<String, dynamic> json) {
    return CategoryJson(
      id: json['id'] as String,
      categoryName: json['category_name'] as String,
      image: "$categoryImgDir/${json['image']}",
      status: json['status'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
    );
  }

  Categories toDomain() => Categories(
      id: id,
      categoryName: categoryName,
      image: image,
      status: status,
      time: time,
      date: DateTime.parse(date));
}
