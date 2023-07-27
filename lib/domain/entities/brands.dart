import 'package:equatable/equatable.dart';

class Brands extends Equatable {
  final String id;
  final String brandName;
  final String image;
  final String status;
  final String time;
  final DateTime date;

  const Brands({
    required this.id,
    required this.brandName,
    required this.image,
    required this.status,
    required this.time,
    required this.date,
  });

  factory Brands.empty() => Brands(
      id: '',
      brandName: '',
      image: '',
      status: '',
      time: '',
      date: DateTime.now());

  Brands copyWith({
    String? id,
    String? brandName,
    String? image,
    String? status,
    String? time,
    DateTime? date,
  }) =>
      Brands(
        id: id ?? this.id,
        brandName: brandName ?? this.brandName,
        image: image ?? this.image,
        status: status ?? this.status,
        time: time ?? this.time,
        date: date ?? this.date,
      );

  @override
  List<Object?> get props => [id, brandName, image, status];
}
