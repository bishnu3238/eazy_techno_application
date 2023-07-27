import 'package:equatable/equatable.dart';

class Banners extends Equatable {
  final String id;
  final String imagePath;
  final String status;

  const Banners({
    required this.id,
    required this.imagePath,
    required this.status,
  });

  Banners copyWith({
    String? id,
    String? imagePath,
    String? status,
  }) =>
      Banners(
        id: id ?? this.id,
        imagePath: imagePath ?? this.imagePath,
        status: status ?? this.status,
      );

  factory Banners.empty() => const Banners(id: '', imagePath: '', status: '');

  @override
  List<Object?> get props => [id, imagePath, status];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'status': status,
    };
  }

  factory Banners.fromMap(Map<String, dynamic> map) {
    return Banners(
      id: map['id'] as String,
      imagePath: map['imagePath'] as String,
      status: map['status'] as String,
    );
  }
}
