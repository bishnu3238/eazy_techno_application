import 'package:eazy_techno_application/package/package/package.dart';

import '../../app_constants/app_constant.dart';


class UserJson {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String gender;
  final String image;
  final String status;
  final String time;
  final String date;

  const UserJson({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phone,
    required this.gender,
    required this.status,
    required this.time,
    required this.date,
  });

  factory UserJson.fromJson(Map<String, dynamic> json) {
    return UserJson(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      status: json['status'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
    );
  }

  User toDomain() => User(
      id: id,
      name: name,
      image: '$categoryImgDir/$image',
      phone: phone,
      email: email,
      gender: gender.stringToGender,
      date: DateTime.parse(date));
}
