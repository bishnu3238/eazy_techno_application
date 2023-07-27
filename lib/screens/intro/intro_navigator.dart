import 'package:eazy_techno_application/main.dart';
import 'package:flutter/cupertino.dart';

import '../../package/navigator/app_navigator.dart';
import '../home/e_home.dart';
import '../index/index_navigator.dart';
import 'intro.dart';
import 'intro_cubit.dart';
import 'intro_initial_params.dart';

class IntroNavigator with IndexRoute , HomeRoute {
  IntroNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin IntroRoute {
  openIntro(IntroInitialParams initialParams) => navigator.pushReplacement(
      context, Intro(cubit: getIt(param1: initialParams)));



  AppNavigator get navigator;

  BuildContext get context;
}
