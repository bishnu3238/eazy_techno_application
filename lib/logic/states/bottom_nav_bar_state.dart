import 'package:flutter/material.dart';


class BottomNavBarState {
  int navBarIndex;


  BottomNavBarState({required this.navBarIndex});

  factory BottomNavBarState.initial() =>
      BottomNavBarState(navBarIndex: 0);

  BottomNavBarState copyWith(int? navBarIndex) =>
      BottomNavBarState(navBarIndex: navBarIndex ?? this.navBarIndex);


}
