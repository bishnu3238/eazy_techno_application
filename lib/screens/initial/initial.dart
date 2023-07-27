import 'package:eazy_techno_application/package/common/extension.dart';
import 'package:flutter/material.dart';
import '../../app_constants/app_constant.dart';
import '../../logic/bloc/cubit/internet_connectivity_cubit.dart';
import '../../logic/states/internet_connectivity_state.dart';
import '../../main.dart';
import '../../package/package/package.dart';
import '../intro/intro_body/intro_loading.dart';
import '../intro/intro_body/intro_no_internet.dart';
import '../intro/intro_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'initial_cubit.dart';

class Initial extends StatelessWidget {
  final InitialCubit cubit;
  const Initial({Key? key, required this.cubit}) : super(key: key);
  static Page<void> page() =>
      MaterialPage<void>(child: Initial(cubit: getIt<InitialCubit>()));

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    cubit.navigator.context = context;

    return BlocConsumer<InternetConnectivityCubit, InternetConnectivityState>(
      bloc: getIt<InternetConnectivityCubit>(),
      builder: (context, state) {
        state.log();
        if (state is InternetConnectionState) {
          return const IntroLoading();
        } else if (state is InternetDisconnectionState) {
          return const IntroNoInternet();
        } else {
          return const IntroLoading();
        }
      },
      listener: (BuildContext context, InternetConnectivityState state) {
        if (state is InternetConnectionState) {
          cubit.openIntro(const IntroInitialParams());
        } else if (state is InternetDisconnectionState) {
          state.log();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Your are offline!.")));
        }
      },
    );
  }
}
