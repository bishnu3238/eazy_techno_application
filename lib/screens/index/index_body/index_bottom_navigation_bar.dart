import 'package:eazy_techno_application/package/common/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_constants/app_constant.dart';
import '../index_cubit.dart';
import '../index_initial_params.dart';
import '../index_state.dart';

class IndexBottomNavigationBar extends StatelessWidget {
  final IndexCubit cubit;

  const IndexBottomNavigationBar({Key? key, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IndexCubit, IndexState>(
      bloc: cubit,
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
          onTap: (int index) => cubit.navBarChange(index),
        );
      },
      listener: (BuildContext context, IndexState state) {
        state.navBarIndex.log();
      },
    );
  }
}
