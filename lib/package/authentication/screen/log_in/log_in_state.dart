import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../package/package.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final PhoneNumber phoneNumber;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final bool isValid;

  LoginState copyWith({
    Email? email,
    Password? password,
    PhoneNumber? phoneNumber,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber?? this.phoneNumber,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password,phoneNumber, status, isValid, errorMessage];
}
