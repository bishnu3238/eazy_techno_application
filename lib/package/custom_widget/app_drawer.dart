import 'package:eazy_techno_application/app_constants/app_constant.dart';
import 'package:eazy_techno_application/app_constants/app_info.dart';
import 'package:eazy_techno_application/domain/stores/store.dart';
import 'package:eazy_techno_application/domain/use_cases/use_case.dart';
import 'package:eazy_techno_application/main.dart';
import 'package:eazy_techno_application/screens/brands/brands.dart';
import 'package:eazy_techno_application/screens/home/e_home.dart';
import 'package:eazy_techno_application/screens/home/home.dart';
import 'package:eazy_techno_application/screens/my_orders/e_my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../package/package.dart';

class AppDrawer extends StatelessWidget {
  final List<DrawerItem>? drawerItems;

  const AppDrawer({
    Key? key,
    this.drawerItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigate = getIt<AppNavigator>();
    return Drawer(
      width: getScreenWidth(kLayoutWidth / 1.4),
      child: ListView(
        children: [
          const UserDetailsDrawerHeader(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Navigate to the home page.
              navigate.pushReplacement(context,
                  Home(bloc: getIt<HomeBloc>(param1: HomeInitialParams())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('My Orders'),
            onTap: () {
              // Navigate to the home page.
              navigate.pushReplacement(
                  context,
                  MyOrders(
                      bloc: getIt<MyOrdersBloc>(
                          param1: MyOrdersInitialParams())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Popular Brands'),
            onTap: () {
              // Navigate to the home page.
              navigate.pushReplacement(context, const BrandsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('Notification'),
            onTap: () {
              // Navigate to the home page.
              // navigate.pushReplacement(context,
              //     NotificationScreen(bloc: getIt<HomeBloc>(param1: HomeInitialParams())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              // Navigate to the home page.
              // navigate.pushReplacement(context,
              //     CartScreen(bloc: getIt<CartBloc>()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('Reviews'),
            onTap: () {
              // Navigate to the home page.
              // navigate.pushReplacement(context,
              //  const    Reviews());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to the home page.
              // navigate.pushReplacement(context,
              //     Settings(bloc: getIt<SettingsBloc>(param1: SettingsInitialParams())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.pin_drop),
            title: const Text('Add Address'),
            onTap: () {
              // Navigate to the home page.
              // navigate.pushReplacement(context,
              //     AddAddress( ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.point_of_sale),
            title: const Text('Points'),
            onTap: () {
              // Navigate to the home page.
            },
          ),

          const Divider(),
          const HeadLine(headline: 'Info'),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('About Us'),
            onTap: () {
              // Navigate to the home page.
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Terms & Condition'),
            onTap: () {
              // Navigate to the home page.
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Contact Us'),
            onTap: () {
              // Navigate to the home page.
            },
          ),
          // ListView.builder(
          //     itemCount: drawerItems == null ? 0 : drawerItems!.length,
          //     itemBuilder: (ctx, index) {
          //       var drawerItem;
          //       drawerItems == null ? null : drawerItem = drawerItems![index];
          //       return ListTile(
          //         title: drawerItem.custom ?? Text(drawerItem.title),
          //         subtitle: Text(drawerItem.subtitle),
          //         leading: drawerItem.leading,
          //         onTap: drawerItem.onTap,
          //       );
          //     }),
          BlocBuilder(
            bloc: getIt<ThemeStore>(),
            builder: (context, state) {
              return ListTile(
                leading: state == ThemeType.light
                    ? const FaIcon(FontAwesomeIcons.solidSun)
                    : const FaIcon(FontAwesomeIcons.moon),
                title:
                    Text(state == ThemeType.light ? "Dark Mode" : "Light Mode"),
                onTap: () => getIt<UpdateThemeUseCase>().execute(
                    state == ThemeType.light
                        ? ThemeType.dark
                        : ThemeType.light),
              );
            },
          )
        ],
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final String subtitle;
  final Widget leading;
  final Widget? custom;
  final VoidCallback onTap;

  const DrawerItem({
    this.title = '',
    this.subtitle = '',
    this.leading = const Icon(Icons.account_circle),
    this.custom,
    required this.onTap,
  });
}
