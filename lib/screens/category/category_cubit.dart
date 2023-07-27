import 'package:bloc/bloc.dart';
import 'package:eazy_techno_application/package/package/package.dart';
import 'package:eazy_techno_application/screens/home/e_home.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/repository.dart';
import '../my_orders/e_my_orders.dart';
import 'e_category.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryInitialParams categoryInitialParams;
  final CategoryRepository categoryRepository;
  final BrandRepository brandRepository;
  final CategoryNavigator navigator;

  CategoryCubit(
    this.categoryInitialParams,
    this.categoryRepository,
    this.navigator,
    this.brandRepository,
  ) : super(CategoryState.empty());

  void openDrawer(ScaffoldState scaffoldState) => scaffoldState.openDrawer();
  handelNavigateFromBottomNavBar(int index) {
    if (state.categoryIndex == index) return;

    switch (index) {
      case 0:
        navigator.openHome(HomeInitialParams());
      case 2:
        navigator.openMyOrders(MyOrdersInitialParams());
      case 3:
        navigator.openMyOrders(MyOrdersInitialParams());
      case 4:
        navigator.openMyOrders(MyOrdersInitialParams());
    }
  }
}
