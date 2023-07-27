
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/e_home.dart';
import '../index/index_initial_params.dart';
import 'intro_body/intro_body.dart';
import 'intro_cubit.dart';


class Intro extends StatefulWidget {
  final IntroCubit cubit;

  const Intro({Key? key, required this.cubit}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  IntroCubit get cubit => widget.cubit;
  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: cubit,
        builder: (context, state) {
          return const IntroBody();
        },
        listener: (BuildContext context, IntroState state) {
          if (state.isDone) cubit.openHome(HomeInitialParams());
        },
      ),
    );
  }
}
