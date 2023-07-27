import 'package:eazy_techno_application/screens/widgets/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../package/package/package.dart';
import 'e_home.dart';
import 'home_body/home_show_brands.dart';

class Home extends StatelessWidget {
  final HomeBloc bloc;
  const Home({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.navigator.context = context;

    return Scaffold(
      key: bloc.state.homeScaffoldKey,
      drawer: const AppDrawer(drawerItems: []),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    HomeAppBar(bloc),
                    HomeImageSlider(bloc),
                    HomeShowBrands(bloc),
                    HomeOfferTemplate(bloc),
                    HomeShowBestSeller(bloc),
                    HomeShowOurProducts(bloc),
                  ],
                );
        },
      ),
      bottomNavigationBar: AppBottomNavigationBar((index) {
        print("hello $index");
        bloc.add(NavigateFromBottomNavBar(index: index));
      }),
    );
  }
}
