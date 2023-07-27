abstract class AuthFailure implements Exception{
  AuthFailure();
}


class FirebaseSignUpWithEmailAndPasswordFailure implements AuthFailure {

  const FirebaseSignUpWithEmailAndPasswordFailure(
      [this.message = 'An unknown exception occurred.']);

  factory FirebaseSignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const FirebaseSignUpWithEmailAndPasswordFailure();
    }
  }
  final String message;
}

class FirebaseLogInWithEmailAndPasswordFailure implements AuthFailure {
  const FirebaseLogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory FirebaseLogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseLogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const FirebaseLogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const FirebaseLogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const FirebaseLogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const FirebaseLogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class LogInWithGoogleFailure implements AuthFailure {
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  final String message;
}

class LogOutFailure implements AuthFailure {
  const LogOutFailure([this.message = 'An unknown exception occurred.']);
  final String message;
}
