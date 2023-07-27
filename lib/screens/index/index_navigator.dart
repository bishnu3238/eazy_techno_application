

import 'package:flutter/cupertino.dart';

import '../../main.dart';
import '../../package/package/package.dart';
import 'index.dart';
import 'index_initial_params.dart';

class  IndexNavigator {}

mixin  IndexRoute {
  openIndex( IndexInitialParams initialParams) {
    navigator.pushAndRemoveUntil(context,  Index(indexCubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;
  BuildContext get context;
}
