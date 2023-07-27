import 'package:eazy_techno_application/domain/stores/store.dart';
import 'package:eazy_techno_application/main.dart';
import 'package:eazy_techno_application/package/common/extension.dart';
import 'package:eazy_techno_application/screens/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/banner.dart';
import '../../widgets/image_slider.dart';

class HomeImageSlider extends StatelessWidget {
  final HomeBloc _bloc;
  const HomeImageSlider(this._bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider.value(
        value: _bloc,
        child:Card(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 15),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
    ),
    child: SizedBox(
    width: double.maxFinite,
    child: ImageSlider(
          imageUrls: _bloc.bannerRepository.getBanner().imagePath,
        ),
      ),),),
    );
  }
}
