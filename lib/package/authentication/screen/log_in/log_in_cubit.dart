import 'package:bloc/bloc.dart';
import 'package:eazy_techno_application/package/notifier/snack_notifier.dart';
import 'package:formz/formz.dart';
 import 'log_in_state.dart';
import '../../../package/package.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository, this.notifier) : super(const LoginState());

  final AuthRepository _authRepository;
  final Notifier notifier;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> logInWithDB() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.logInWithDB(
        userName: state.email.value,
        password: state.password.value,
        url: '',
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithServerFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }


  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
