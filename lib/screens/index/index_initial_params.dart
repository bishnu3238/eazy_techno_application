import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_constants/app_constant.dart';



class  IndexInitialParams{

}




List<Map<NavBarParams, dynamic>> bottomNavigationBarItems = [
  {
    NavBarParams.icon: const Icon(FontAwesomeIcons.house),
    NavBarParams.label: 'Home'
  },
  {
    NavBarParams.icon: const Icon(FontAwesomeIcons.tableCells),
    NavBarParams.label: 'Category'
  },
  {
    NavBarParams.icon: const Icon(FontAwesomeIcons.bagShopping),
    NavBarParams.label: 'My Orders'
  },
  {
    NavBarParams.icon: const Icon(FontAwesomeIcons.bell),
    NavBarParams.label: 'Notification'
  },
  {
    NavBarParams.icon: const Icon(FontAwesomeIcons.gear),
    NavBarParams.label: 'Setting'
  },
];