
import '../intro/intro_initial_params.dart';
import 'initial_navigator.dart';

class InitialCubit{
  InitialNavigator navigator;
  InitialCubit(this.navigator);

  openIntro(IntroInitialParams initialParams)async {
    Future.delayed(const Duration(seconds: 1))
        .then((value) => navigator.openIntro(initialParams));
  }



}