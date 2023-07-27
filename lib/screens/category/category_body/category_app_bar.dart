import 'dart:async';
import 'package:eazy_techno_application/screens/category/e_category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../app_constants/app_constant.dart';
import '../../../package/package/package.dart';

class CategoryAppBar extends StatelessWidget {
  final CategoryCubit bloc;
  const CategoryAppBar(this.bloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SilverAppBar(
      centerTitle: false,
      leading: FavIcon<int, void>(
          icon: FontAwesomeIcons.bars,
          iconColor: kDBlue,
          onTap: () =>
              bloc.openDrawer(bloc.state.categoryScaffoldKey.currentState!)),
      titleWidget: const Text("Category"),
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
