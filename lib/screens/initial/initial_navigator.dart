
import 'package:flutter/material.dart';

import '../../package/package/package.dart';
import '../intro/intro_navigator.dart';

class InitialNavigator with IntroRoute{
  InitialNavigator(this.navigator);


  @override
  late BuildContext context;

  @override
  AppNavigator navigator;

}