import 'package:eazy_techno_application/screens/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeOfferTemplate extends StatelessWidget {
  final HomeBloc _bloc;
  const HomeOfferTemplate(this._bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          // TODO: show offer templates;
          return const SizedBox();
        },
      ),
    );
  }
}
