import 'package:eazy_techno_application/package/package/package.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../states/bottom_nav_bar_state.dart';

class AppBottomNavBarCubit extends Cubit<BottomNavBarState> {
  final AppNavigator navigator;

  AppBottomNavBarCubit(this.navigator) : super(BottomNavBarState.initial());

  int navBarChange(int index) {
    emit(state.copyWith(index));
    return state.navBarIndex;
  }
}
