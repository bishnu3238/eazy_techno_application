import 'package:eazy_techno_application/app_constants/app_constant.dart';
import 'package:eazy_techno_application/screens/category/e_category.dart';
import 'package:eazy_techno_application/screens/category/category.dart';
import 'package:eazy_techno_application/screens/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../../package/package/package.dart';
import '../home/home.dart';
import '../home/home_bloc.dart';
import '../home/home_initial_params.dart';
import '../index/index_cubit.dart';
import '../index/index_state.dart';
import 'index_body/index_bottom_navigation_bar.dart';

class Index extends StatefulWidget {
  final IndexCubit indexCubit;

  const Index({Key? key, required this.indexCubit}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  IndexCubit get cubit => widget.indexCubit;
  @override
  void initState() {
    super.initState();
    cubit.fetchInitialDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexCubit, IndexState>(
      bloc: cubit,
      builder: (context, state) {
        return FutureBuilder(
            future: Future.delayed(oneSecond, () {
              // Simulate loading/intro screen delay
              return state.isAppOpenedBefore;
            }),
            builder: (ctx, snapshot) {
              if (snapshot.hasData && snapshot.data!) {
                // App has been opened before, navigate to the last known page
                Navigator.of(context).pushReplacementNamed(state.currentPage);
                return Text('');
              } else {
                // App is opened for the first time, show the intro screens
                return Text("");

                //   Intro(
                //   onIntroComplete: () {
                //     appState.setAppOpenedBefore();
                //     Navigator.of(context).pushReplacementNamed('/home');
                //   },
                // );
              }
            });

        //   SafeArea(
        //   child: Scaffold(
        //     body: [
        //       Home(
        //         bloc: getIt<HomeBloc>(param1: HomeInitialParams()),
        //       ),
        //       CategoryScreen(
        //         cubit: getIt<CategoryCubit>(param1: CategoryInitialParams()),
        //       ),
        //       Text(state.navBarIndex.toString()),
        //       Text(state.navBarIndex.toString()),
        //       Text(state.navBarIndex.toString()),
        //     ][state.navBarIndex],
        //     bottomNavigationBar: IndexBottomNavigationBar(cubit: cubit),
        //   ),
        // );
      },
    );
  }
}
