import 'package:eazy_techno_application/screens/home/e_home.dart';
import 'package:eazy_techno_application/screens/my_orders/e_my_orders.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';
import '../../package/package/package.dart';
import 'e_category.dart';

class CategoryNavigator with HomeRoute, MyOrdersRoute {
  CategoryNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin CategoryRoute {
  openCategory(CategoryInitialParams initialParams) =>
      navigator.pushAndRemoveUntil(
          context, CategoryScreen(cubit: getIt(param1: initialParams)));
  AppNavigator get navigator;
  BuildContext get context;
}
