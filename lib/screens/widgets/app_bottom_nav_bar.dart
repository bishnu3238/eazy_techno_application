import 'package:eazy_techno_application/package/common/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_constants/app_constant.dart';
import '../../logic/bloc/cubit/cubit.dart';
import '../../logic/states/states.dart';
import '../../main.dart';
import '../index/index_initial_params.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final Function(int index) param0;
  const AppBottomNavigationBar( this.param0, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBottomNavBarCubit, BottomNavBarState>(
      bloc: getIt<AppBottomNavBarCubit>(),
      buildWhen: (state, next) => (state.navBarIndex != next.navBarIndex),
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.navBarIndex,
          type: BottomNavigationBarType.fixed,
          items: bottomNavigationBarItems
              .map<BottomNavigationBarItem>(
                (e) => BottomNavigationBarItem(
                  icon: e[NavBarParams.icon],
                  label: e[NavBarParams.label],
                ),
              )
              .toList(),
          onTap: (int index) {
            getIt<AppBottomNavBarCubit>().navBarChange(index);
            param0(index);
          },
        );
      },
      listener: (BuildContext context, BottomNavBarState state) {
        state.navBarIndex.log();
      },
    );
  }
}
