import 'package:eazy_techno_application/app_constants/app_constant.dart';
import 'package:eazy_techno_application/package/package/package.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String image;
  final String phone;
  final String email;
  final Gender gender;
  final AuthStatus status;
  final DateTime? date;

  const User({
    required this.id,
    this.name = '',
    this.image = '',
    this.phone = '',
    this.email = '',
    this.gender = Gender.unknown,
    this.status = AuthStatus.unknown,
    this.date,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'phone': phone,
        'email': email,
        'gender': gender.name,
        'date': date.toString()
      };

  User formJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      phone: json['phone'],
      email: json['email'],
      gender: (json['gender'] as String).stringToGender,
      date: json['date'] == null
          ? DateTime.now()
          : (json['date'] as String).stringToDate,
    );
  }

  User copyWith({
    String? id,
    String? name,
    String? image,
    String? phone,
    String? email,
    Gender? gender,
    AuthStatus? status,
    DateTime? date,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        status: status ?? this.status,
        date: date ?? this.date,
      );

  static const empty = User(id: '', status: AuthStatus.unauthenticated);

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  String toString() {
    return 'User{id: $id, name: $name, image: $image, phone: $phone, email: $email, gender: $gender, status: $status, date: $date}';
  }

  @override
  List<Object?> get props => [id, name, phone, email, image, date];
}
