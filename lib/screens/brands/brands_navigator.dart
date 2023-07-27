import 'package:eazy_techno_application/screens/brands/brands.dart';
import 'package:eazy_techno_application/screens/category/category_navigator.dart';
import 'package:eazy_techno_application/screens/my_orders/e_my_orders.dart';
import 'package:flutter/cupertino.dart';

import '../../package/package/package.dart';
import 'e_brands.dart';

class BrandsNavigator with CategoryRoute, MyOrdersRoute {
  BrandsNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin BrandsRoute {
  openBrands(BrandsInitialParams initialParams) =>
      navigator.push(context, const BrandsScreen());

  AppNavigator get navigator;
  BuildContext get context;
}
