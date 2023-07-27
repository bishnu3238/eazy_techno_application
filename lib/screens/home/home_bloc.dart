import 'dart:async';

import 'package:eazy_techno_application/domain/repositories/repository.dart';
import 'package:eazy_techno_application/logic/bloc/cubit/cubit.dart';
import 'package:eazy_techno_application/package/package/package.dart';
import 'package:eazy_techno_application/screens/category/e_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/stores/store.dart';
import '../../main.dart';
import '../index/index_cubit.dart';
import '../my_orders/e_my_orders.dart';
import 'e_home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeInitialParams initialParams;
  final HomeNavigator navigator;
  final NetworkService networkService;
  final BannerRepository bannerRepository;
  final BrandRepository brandRepository;
  final ItemRepository itemRepository;

  HomeBloc(
    this.initialParams,
    this.navigator,
    this.networkService,
    this.bannerRepository,
    this.brandRepository,
    this.itemRepository,
  ) : super(HomeState(isLoading: false)) {
    on<OpenDrawer>((event, emit) => event.scaffoldState.openDrawer());
    on<NavigateFromBottomNavBar>(_handelNavigateFromBottomNavBar);
  }

  _handelNavigateFromBottomNavBar(
      NavigateFromBottomNavBar event, Emitter<HomeState> emit) {
    if (state.homeIndex == event.index) return;

    switch (event.index) {
      case 1:
        navigator.openCategory(CategoryInitialParams());
      case 2:
        navigator.openMyOrders(MyOrdersInitialParams());
      case 3:
        navigator.openMyOrders(MyOrdersInitialParams());
      case 4:
        navigator.openMyOrders(MyOrdersInitialParams());
    }
  }
}
