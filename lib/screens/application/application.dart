import 'package:eazy_techno_application/screens/runner/runner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';
import '../../package/package/package.dart';
import 'app.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    // add multi bloc provider and repository provider
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (ctx) => AppBloc(
              authRepository: getIt<UserAuthRepository>())),
    ], child: const Runner());
  }
}
