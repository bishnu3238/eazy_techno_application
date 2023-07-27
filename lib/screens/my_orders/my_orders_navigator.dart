import 'package:eazy_techno_application/screens/home/e_home.dart';
import 'package:eazy_techno_application/screens/my_orders/e_my_orders.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';
import '../../package/package/package.dart';

class MyOrdersNavigator with HomeRoute {

  MyOrdersNavigator(this.navigator);
  @override

  late BuildContext   context  ;

  @override
   AppNavigator   navigator  ;



}

mixin MyOrdersRoute {
  openMyOrders(MyOrdersInitialParams initialParams) =>
      navigator.push(context, MyOrders(bloc: getIt(param1: initialParams)));

  AppNavigator get navigator;
  BuildContext get context;
}
