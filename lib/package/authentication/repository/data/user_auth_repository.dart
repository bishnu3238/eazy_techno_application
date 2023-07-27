import 'dart:async';

import 'package:eazy_techno_application/app_constants/app_constant.dart' as con;
import 'package:eazy_techno_application/app_constants/app_constant.dart';
import 'package:eazy_techno_application/package/network/network_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../authentication.dart';

typedef CodeSend = T Function<T>(String, int?);

class UserAuthRepository implements AuthRepository {
  final UserStore userStore;
  final NetworkService networkService;
  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  final controller = StreamController<AuthStatus>();

  UserAuthRepository({
    required this.userStore,
    required this.networkService,
    CacheClient? cache,
    auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSingIn,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _googleSignIn = googleSingIn ?? GoogleSignIn.standard();

  @override
  User get currentUser => userStore.state;

  @override
  Future<void> logInWithDB({
    required String userName,
    required String password,
    required String url,
  }) async {
    try {
      var result = await networkService.post(
        url,
        {'mobile': userName, 'password': password},
      );
    } catch (e) {
      throw LogInWithServerFailure(e.toString());
    }
  }

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on auth.FirebaseAuthException catch (e) {
      throw FirebaseLogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const FirebaseLogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<auth.UserCredential> logInWithGoogle() async {
    try {
      late final auth.AuthCredential credential;
      if (kIsWeb) {
        auth.GoogleAuthProvider googleProvider = auth.GoogleAuthProvider();
        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

        return await _firebaseAuth.signInWithPopup(googleProvider);
      } else {
        final googleUser = await _googleSignIn.signIn();

        final googleAuth = await googleUser?.authentication;

        credential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        return await _firebaseAuth.signInWithCredential(credential);
      }
    } on auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  @override
  void logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
      userStore.setUser(User.empty);
    } catch (e) {
      throw const LogOutFailure();
    }
  }

  @override
  Future<void> phoneAuthWithFirebase(
      {required String phoneNo, required CodeSend codeSend}) async {
    if (kIsWeb) {
      auth.ConfirmationResult confirmationResult =
          await _firebaseAuth.signInWithPhoneNumber(
        phoneNo,
        // auth.RecaptchaVerifier(
        //   container: 'recaptcha',
        //   size: auth.RecaptchaVerifierSize.compact,
        //   theme: auth.RecaptchaVerifierTheme.dark,
        //   onSuccess: () => 'reCAPTCHA Completed!'.log,
        //   onError: (auth.FirebaseAuthException error) => error.log,
        //   onExpired: () => 'reCAPTCHA Expired!'.log,
        // ),
      );
// TODO: verify sms code;
      auth.UserCredential userCredential =
          await confirmationResult.confirm('123456');
    } else {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (auth.PhoneAuthCredential credential) {},
        verificationFailed: (auth.FirebaseAuthException e) {
          throw FirebasePhoneVerificationFailure.fromCode(e.code);
        },
        codeSent: codeSend<void>,
        timeout: con.oneSecond,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }

  @override
  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      throw FirebaseSignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const FirebaseSignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(con.oneSecond);
    yield AuthStatus.unauthenticated;
    yield* controller.stream;
  }

  @override
  // TODO: here have some complications , because user getting from local or firebase local;
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      User user = firebaseUser == null ? userStore.state : firebaseUser.toUser;
      userStore.setUser(user);
      return user;
    });
  }

  @override
  void dispose() => controller.close();

  @override
  Future<void> checkPhoneNumberExistsOrNot(
      {required String phoneNumber, required String url}) async {
    await networkService.post(
      url,
      {'mobile': phoneNumber},
    );
  }
}

extension on auth.User {
  User get toUser => User(
      id: uid,
      name: displayName??'',
      email: email??'',
      phone: phoneNumber??'',
      image: photoURL??'',
      gender: Gender.unknown,
      date: DateTime.now(),
      status: AuthStatus.authenticated);
}
