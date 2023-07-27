import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../authentication.dart';

abstract class AuthRepository {
  User get currentUser;
  Stream<User> get user;
  Stream<AuthStatus> get status;

  ///
  ///
  Future<auth.UserCredential> logInWithGoogle();

  ///
  ///
  Future<void> logInWithEmailAndPassword(
    String email,
    String password,
  );

  ///
  ///
  Future<void> checkPhoneNumberExistsOrNot({
    required String phoneNumber,
    required String url,
  });

  ///
  ///
  Future<void> phoneAuthWithFirebase({
    required String phoneNo,
    required CodeSend codeSend,
  });

  ///
  ///
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  });

  ///
  ///
  Future<void> logInWithDB({
    required String userName,
    required String password,
    required String url,
  });

  ///
  ///
  void logOut();

  ///
  ///
  void dispose();
}
