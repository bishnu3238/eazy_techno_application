import 'package:eazy_techno_application/package/custom_widget/simple_app_bar.dart';
import 'package:eazy_techno_application/package/package/package.dart';
import 'package:eazy_techno_application/screens/widgets/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:eazy_techno_application/screens/my_orders/e_my_orders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrders extends StatefulWidget {
  final MyOrdersBloc bloc;
  const MyOrders({super.key, required this.bloc});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  MyOrdersBloc get bloc => widget.bloc;

  late final _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, MyOrderState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            key: state.myOrderScaffoldKey,
            drawer: const AppDrawer(drawerItems: []),
            appBar: MyOrderAppBar(
              bloc: bloc,
              preferredSize: const Size.fromHeight(kToolbarHeight * 2),
              tabController: _tabController,
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                CurrentOrder(),
                PreviousOrder(),
              ],
            ),
            bottomNavigationBar: AppBottomNavigationBar((index) => null),
          );
        });
  }
}
