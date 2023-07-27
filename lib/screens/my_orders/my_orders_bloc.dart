import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'e_my_orders.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrderState> {
  final MyOrdersInitialParams initialParams;
  MyOrdersBloc(this.initialParams) : super(MyOrderState());

  openDrawer(ScaffoldState scaffoldState) => scaffoldState.openDrawer();
}
