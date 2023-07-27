import 'package:eazy_techno_application/screens/category/category_navigator.dart';
import 'package:eazy_techno_application/screens/my_orders/e_my_orders.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';
import '../../package/package/package.dart';
import '../brands/e_brands.dart';
import 'e_home.dart';

class HomeNavigator with CategoryRoute, MyOrdersRoute, BrandsRoute {
  HomeNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin HomeRoute {
  openHome(HomeInitialParams initialParams) => navigator.pushAndRemoveUntil(
      context, Home(bloc: getIt(param1: initialParams)));

  AppNavigator get navigator;
  BuildContext get context;
}
