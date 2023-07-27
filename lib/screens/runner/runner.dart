import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import '../../app_constants/app_constant.dart';
import '../../domain/stores/store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';
import '../../package/package/package.dart';
import '../application/app.dart';
import '../initial/initial.dart';
import '../initial/initial_cubit.dart';

class Runner extends StatelessWidget {
  const Runner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeStore, ThemeType>(
        bloc: getIt<ThemeStore>(),
        builder: (context, state) {
          return MaterialApp(
            theme: state == ThemeType.light ? light : dark,
            home: FlowBuilder(
              state: context.select((AppBloc bloc) => bloc.state.status),
              // builder: (context) {
              //   return Initial(
              //     cubit: getIt<InitialCubit>(),
              //   );
              // },
              onGeneratePages: onGenerateAppViewPages,
            ),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
List<Page<dynamic>> onGenerateAppViewPages(
    AppStatus state,
    List<Page<dynamic>> pages,
    ) {
  switch (state) {
    case AppStatus.authenticated:
      return [Initial.page()];
    case AppStatus.unauthenticated:
      return [Initial.page()];
  }
}