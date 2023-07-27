import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../app_constants/app_constant.dart';
import '../../../package/package/package.dart';
import '../e_home.dart';

class HomeAppBar extends StatelessWidget {
  final HomeBloc bloc;
  const HomeAppBar(this.bloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldState = bloc.state.homeScaffoldKey.currentState;
    return SilverAppBar(
      centerTitle: false,
      leading: FavIcon<int, void>(
        icon: FontAwesomeIcons.bars,
        onTap: () => bloc.add(OpenDrawer(scaffoldState: scaffoldState!)),
      ),
      titleWidget: Image.asset(appLogo, width: getScreenWidth(100)),
      actionButtons: const [
        /// search icon
        FavIcon(icon: Icons.search, onIconPressed: dummy),

        /// cart icon
        FavIcon(icon: Icons.shopping_cart, onIconPressed: dummy),

        /// user pop up icon
        FavIcon(icon: Icons.search, onIconPressed: dummy),
      ],
    );
  }
}

Future<String> search(int? value) async {
  return value.toString();
}
