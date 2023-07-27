 import 'package:flutter/foundation.dart' show immutable;
import '../../../domain/entities/user.dart';

@immutable
abstract class UserRepository {
  Future<User?> getUser();
}
