import 'package:eazy_techno_application/main.dart';
import 'package:eazy_techno_application/package/authentication/screen/log_in/log_in_body/login_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../package/package.dart';
import 'log_in_cubit.dart';
import 'log_in_body/log_in_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogInAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(getIt<UserAuthRepository>(), getIt()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
