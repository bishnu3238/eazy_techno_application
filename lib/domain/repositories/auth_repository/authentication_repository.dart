import 'dart:async';
 import '../../../app_constants/enumeration.dart';
import '../../entities/user.dart';

abstract class AuthenticationRepository {
  User get currentUser;
  Stream<User> get user;
  Stream<AuthenticationStatus> get status;

  Future<void> logInWithGoogle();
  Future<void> phoneAuthWithFirebase({required String phoneNo});
  Future<void> logInWithFB({required String email, required String password});
  Future<void> signUpWithFB({required String email, required String password});
  Future<void> logInWithDB({required String userName, required String password});

  void logOut();
  void dispose();
}
