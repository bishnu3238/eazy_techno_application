import 'package:flutter/material.dart';

class HomeState{

  final bool isLoading;
  final int homeIndex;
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  HomeState({this.isLoading = false, this.homeIndex = 0});
}