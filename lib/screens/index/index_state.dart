import 'package:flutter/material.dart';

import 'index_initial_params.dart';

class IndexState {
  int navBarIndex;

  bool isAppOpenedBefore = false;
  bool get isappopenedbefore => isAppOpenedBefore;

  String currentPage;
  String get currentpage => currentPage;

  IndexState(
      {required this.navBarIndex,
      this.currentPage = '/home',
      this.isAppOpenedBefore = false});

  factory IndexState.initial({required IndexInitialParams initialParams}) =>
      IndexState(navBarIndex: 0);

  IndexState copyWith(
      {int? navBarIndex, String? currentPage, bool? isAppOpenedBefore}) =>
      IndexState(
          navBarIndex: navBarIndex ?? this.navBarIndex,
          currentPage: currentPage ?? this.currentPage,
          isAppOpenedBefore: isAppOpenedBefore ?? this.isAppOpenedBefore);
}
