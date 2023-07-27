import 'package:flutter/material.dart';

 abstract class HomeEvent {
  const HomeEvent();
}


class OpenDrawer extends HomeEvent{
  ScaffoldState scaffoldState;
  OpenDrawer({required this.scaffoldState});
}

class NavigateFromBottomNavBar extends HomeEvent{
  int index;
  NavigateFromBottomNavBar({required this.index});
}