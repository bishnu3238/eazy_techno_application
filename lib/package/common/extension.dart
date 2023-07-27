import 'dart:developer' as dev show log;
import 'package:eazy_techno_application/domain/entities/banner.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth show User;

import '../../app_constants/app_constant.dart';
import '../../domain/entities/user.dart';

extension Log on String {
  void log() => dev.log(this);
}

extension ToString on Object {
  void log() => dev.log(toString());
}

extension ToStringNullable on Object? {
  void log() => dev.log(toString());
}

extension PhoneNumberHide on String {
  String get phoneNumberHide {
    if (length == 10) {
      final maskedLength = length - 2;
      final maskedCharacters = 'x' * maskedLength;
      final maskedPhoneNo = replaceRange(1, maskedLength, maskedCharacters);
      return maskedPhoneNo;
    } else {
      trim();
      final hideLength = length - 4;
      final hideCharacters = 'x' * hideLength;
      final maskedPhoneNo = replaceRange(2, hideLength + 2, hideCharacters);
      final countryCode = substring(0, 2);
      return '+$countryCode $maskedPhoneNo';
    }
  }
}

extension DMY on DateTime {
  DateTime get dmy {
    return DateTime.parse(DateFormat.yMd().format(this));
  }
}

extension GetGender on String {
  Gender get stringToGender {
    return Gender.values.firstWhere((element) => element.name == this,
        orElse: () => Gender.unknown);
  }
}

extension GetDate on Object? {
  DateTime get stringToDate => this is String && this != null
      ? DateTime.parse(this as String)
      : DateTime.now();
}

extension GetTheme on String {
  ThemeType get theme {
    return ThemeType.values.firstWhere((element) => element.name == this,
        orElse: () => ThemeType.light);
  }
}

extension GetUser on auth.User {
  /// Maps a [auth.User] into a [User].
  User get toDomain {
    return User(
        id: uid,
        email: email!,
        name: displayName!,
        image: photoURL!,
        phone: phoneNumber!,
        gender: Gender.unknown,
        date: DateTime.now());
  }
}

extension ListOfBannerToListOfString on List<Banners> {
  List<String> get imagePath {
    List<String> images = map((e) => e.imagePath).toList();
    return images;
  }
}
