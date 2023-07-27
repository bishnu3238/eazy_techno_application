import 'package:eazy_techno_application/package/custom_widget/simple_app_bar.dart';
import 'package:eazy_techno_application/screens/my_orders/e_my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app_constants/color.dart';
import '../../../package/package/package.dart';

class MyOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final MyOrdersBloc bloc;
  final TabController tabController;

  const MyOrderAppBar(
      {super.key,
      required this.bloc,
      required this.preferredSize,
      required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return SimpleAppBar(
            leading: FavIcon<int, void>(
              icon: FontAwesomeIcons.bars,
              // iconColor: kDBlue,
              onTap: () =>
                  bloc.openDrawer(bloc.state.myOrderScaffoldKey.currentState!),
            ),
            title: "Orders",
            buttons: [],
            tabBarHeight: kToolbarHeight * 2,
            tabBar: TabBar(controller: tabController, tabs: const [
              Tab(child: Text("Current Order")),
              Tab(child: Text("Previous Order"))
            ]),
          );
        });
  }

  @override
  final Size preferredSize;
}
