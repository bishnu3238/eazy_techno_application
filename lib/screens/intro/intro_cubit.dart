import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/repository.dart';
import '../home/e_home.dart';
import '../index/index_initial_params.dart';
import 'intro_initial_params.dart';
import 'intro_navigator.dart';
part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  final IntroInitialParams initialParam;
  final IntroNavigator navigator;
  final CategoryRepository categoryRepository;
  final BrandRepository brandRepository;
  final ItemRepository itemRepository;

  IntroCubit(
    this.initialParam,
    this.navigator,
    this.categoryRepository,
    this.brandRepository,
    this.itemRepository,
  ) : super(IntroState.initial());

  Future fetchInitialDetails() async {
    await categoryRepository
        .fetchCategory()
        .then((value) async => await brandRepository.fetchBrand().then(
              (value) async => await itemRepository.fetchItems(),
            ))
        .whenComplete(
          () => emit(state.copyWith(isDone: true)),
        );
  }

  onInit() {}

  openIndex(IndexInitialParams initialParams) async {
    Future.delayed(const Duration(seconds: 1))
        .then((value) => navigator.openIndex(initialParams));
  }

  openHome(HomeInitialParams initialParams) async {
    Future.delayed(const Duration(seconds: 1))
        .then((value) => navigator.openHome(initialParams));
  }
}
