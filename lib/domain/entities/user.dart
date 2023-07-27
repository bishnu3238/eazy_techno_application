import 'package:equatable/equatable.dart';

import '../../app_constants/app_constant.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String image;
  final String phone;
  final String email;
  final Gender gender;
  final DateTime date;

  const User({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.email,
    required this.gender,
    required this.date,
  });

  User copyWith({
    String? id,
    String? name,
    String? image,
    String? phone,
    String? email,
    Gender? gender,
    DateTime? date,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        date: date ?? this.date,
      );

  @override
  List<Object?> get props => [id, name, phone, email, image, date];

  static User empty() => User(
      id: '',
      name: '',
      image: '',
      phone: '',
      email: '',
      gender: Gender.unknown,
      date: DateTime.now());

  bool get isEmpty => this == User.empty();
  bool get isNotEmpty => this != User.empty();

  @override
  String toString() {
    return 'User{id: $id, name: $name, image: $image, phone: $phone, email: $email, gender: $gender, date: $date}';
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'phone': phone,
        'email': email,
        'gender': gender,
        'date': date.toString()
      };
}
