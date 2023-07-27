import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final String id;
  final String categoryName;
  final String image;
  final String status;
  final String time;
  final DateTime date;

  const Categories({
    required this.id,
    required this.categoryName,
    required this.image,
    required this.status,
    required this.time,
    required this.date,
  });

  factory Categories.empty() => Categories(
      id: '',
      categoryName: '',
      image: '',
      status: '',
      time: '',
      date: DateTime.now());

  Categories copyWith({
    String? id,
    String? categoryName,
    String? image,
    String? status,
    String? time,
    DateTime? date,
  }) =>
      Categories(
        id: id ?? this.id,
        categoryName: categoryName ?? this.categoryName,
        image: image ?? this.image,
        status: status ?? this.status,
        time: time ?? this.time,
        date: date ?? this.date,
      );

  @override
  List<Object?> get props => [id, categoryName, image, status, time, date];
}
