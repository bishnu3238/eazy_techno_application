import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../app_constants/app_constant.dart';
import '../../entities/banner.dart';

class BannerStore extends HydratedCubit<List<Banners>> {
  BannerStore() : super([Banners.empty()]);

  void setBanner(List<Banners> banner) => emit(banner);

  @override
  List<Banners>? fromJson(Map<String, dynamic> json) {
    List<Banners> banners =
        (json[bannersKey] as List).map((e) => Banners.fromMap(e)).toList();
    return banners;
  }

  @override
  Map<String, dynamic>? toJson(List<Banners> state) {
    return {
      bannersKey: state.map((e) => e.toMap()).toList(),
    };
  }
}
