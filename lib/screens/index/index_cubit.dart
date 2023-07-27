import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../domain/repositories/repository.dart';
import 'index_initial_params.dart';
import 'index_navigator.dart';
import 'index_state.dart';

class IndexCubit extends Cubit<IndexState>
    with WidgetsBindingObserver, HydratedMixin {
  final IndexInitialParams initialParams;
  final IndexNavigator navigator;
  final BannerRepository bannerRepository;

  IndexCubit(this.initialParams, this.navigator, this.bannerRepository)
      : super(IndexState.initial(initialParams: initialParams)) {
    hydrate();
  }

  navBarChange(int index) {
    emit(state.copyWith(navBarIndex: index));
  }

  Future fetchInitialDetails() async {
    await bannerRepository.fetchBanners();
  }

  void setAppOpenedBefore() => emit(state.copyWith(isAppOpenedBefore: true));

  void setCurrentPage(String routeName) =>
      emit(state.copyWith(currentPage: routeName));
  @override
  void didChangeAccessibilityFeatures() {
    // TODO: implement didChangeAccessibilityFeatures
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    if (state == AppLifecycleState.paused) {
      saveAppState();
    } else if (state == AppLifecycleState.resumed) {
      restoreAppState();
    }
  }

  void restoreAppState() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // _isAppOpenedBefore = prefs.getBool('isAppOpenedBefore') ?? false;
    // _currentPage = prefs.getString('currentPage') ?? '/home';
    // notifyListeners();
  }
  void saveAppState() async {

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('isAppOpenedBefore', _isAppOpenedBefore);
    // prefs.setString('currentPage', _currentPage);
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    // TODO: implement didChangeLocales
  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
  }

  @override
  void didChangePlatformBrightness() {
    // TODO: implement didChangePlatformBrightness
  }

  @override
  void didChangeTextScaleFactor() {
    // TODO: implement didChangeTextScaleFactor
  }

  @override
  void didHaveMemoryPressure() {
    // TODO: implement didHaveMemoryPressure
  }

  @override
  Future<bool> didPopRoute() {
    // TODO: implement didPopRoute
    throw UnimplementedError();
  }

  @override
  Future<bool> didPushRoute(String route) {
    // TODO: implement didPushRoute
    throw UnimplementedError();
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    // TODO: implement didPushRouteInformation
    throw UnimplementedError();
  }

  @override
  Future<AppExitResponse> didRequestAppExit() {
    // TODO: implement didRequestAppExit
    throw UnimplementedError();
  }

  @override
  IndexState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(IndexState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
