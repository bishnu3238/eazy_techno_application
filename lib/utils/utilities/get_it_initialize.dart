import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eazy_techno_application/domain/use_cases/use_case.dart';
import 'package:eazy_techno_application/screens/brands/e_brands.dart';
import 'package:eazy_techno_application/screens/category/e_category.dart';
import 'package:eazy_techno_application/screens/initial/initial_cubit.dart';
import 'package:eazy_techno_application/screens/initial/initial_navigator.dart';
import '../../data/repositories/repository.dart';
import '../../domain/repositories/repository.dart';
import '../../domain/stores/store.dart';
import '../../logic/bloc/cubit/cubit.dart';
import '../../main.dart';
import '../../package/package/package.dart';
import '../../screens/home/e_home.dart';
import '../../screens/index/index_cubit.dart';
import '../../screens/index/index_initial_params.dart';
import '../../screens/index/index_navigator.dart';
import '../../screens/intro/intro_cubit.dart';
import '../../screens/intro/intro_initial_params.dart';
import '../../screens/intro/intro_navigator.dart';
import '../../screens/my_orders/e_my_orders.dart';

Future getItInitialize() async {
  // Packages
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Internet
  getIt.registerLazySingleton<InternetConnectivityCubit>(
      () => InternetConnectivityCubit(connectivity: getIt()));

  // AppNavigator
  getIt.registerLazySingleton(() => AppNavigator());

  // Network service
  getIt.registerLazySingleton<NetworkService>(() => NetworkService());

  // Notifier
  getIt.registerLazySingleton<Notifier>(() => Notifier());

  // Stores
  getIt.registerLazySingleton<ThemeStore>(() => ThemeStore());
  getIt.registerLazySingleton<BrandStore>(() => BrandStore());
  getIt.registerLazySingleton<ItemsStore>(() => ItemsStore());
  getIt.registerLazySingleton<BannerStore>(() => BannerStore());
  getIt.registerLazySingleton<CategoryStore>(() => CategoryStore());
  getIt.registerLazySingleton<OfferTemplateStore>(() => OfferTemplateStore());

  // Repositories
  getIt.registerLazySingleton<CategoryRepository>(
      () => BiocellarCategoryRepository(getIt(), getIt()));
  getIt.registerLazySingleton<BrandRepository>(
      () => BiocellarBrandRepository(getIt(), getIt()));
  getIt.registerLazySingleton<ItemRepository>(
      () => BiocellarItemRepository(getIt(), getIt()));
  getIt.registerLazySingleton<BannerRepository>(
      () => BiocellarBannerRepository(getIt(), getIt()));
  getIt.registerLazySingleton<OfferTemplateRepository>(
      () => PhpMyAdminOfferTemplateRepository(getIt(), getIt()));

  // user case
  getIt.registerLazySingleton<UpdateThemeUseCase>(
      () => UpdateThemeUseCase(getIt()));

  // bloc & cubit
  getIt.registerLazySingleton<AppBottomNavBarCubit>(
      () => AppBottomNavBarCubit(getIt()));

  // pages

  //initial
  getIt
      .registerLazySingleton<InitialNavigator>(() => InitialNavigator(getIt()));
  getIt.registerLazySingleton<InitialCubit>(() => InitialCubit(getIt()));

  // intro
  getIt.registerLazySingleton<IntroNavigator>(() => IntroNavigator(getIt()));
  getIt.registerFactoryParam<IntroCubit, IntroInitialParams, dynamic>(
      (param1, param2) => IntroCubit(
            param1,
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          )..fetchInitialDetails());

  // index
  getIt.registerLazySingleton<IndexNavigator>(() => IndexNavigator());
  getIt.registerFactoryParam<IndexCubit, IndexInitialParams, dynamic>(
    (param1, param2) => IndexCubit(param1, getIt<IndexNavigator>(), getIt()),
  );

  // home
  getIt.registerLazySingleton<HomeNavigator>(() => HomeNavigator(getIt()));
  getIt.registerFactoryParam<HomeBloc, HomeInitialParams, dynamic>(
    (param1, param2) => HomeBloc(
      param1,
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  // category
  getIt.registerLazySingleton<CategoryNavigator>(
      () => CategoryNavigator(getIt()));
  getIt.registerFactoryParam<CategoryCubit, CategoryInitialParams, dynamic>(
    (param1, param2) => CategoryCubit(
      param1,
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  // my orders
  getIt.registerLazySingleton<MyOrdersNavigator>(
      () => MyOrdersNavigator(getIt()));
  getIt.registerFactoryParam<MyOrdersBloc, MyOrdersInitialParams, dynamic>(
    (param1, param2) => MyOrdersBloc(
      param1,
    ),
  );

  // brands
  getIt.registerSingleton(BrandsNavigator(getIt()));
  getIt.registerLazySingleton(() => BrandsCubit(getIt()));

  /// [Authentication]
  ///
  /// auth repositories [LogIn] [Signup] [Otp]
  getIt.registerSingleton<UserStore>(UserStore());
  getIt.registerLazySingleton<AuthRepository>(
    () => UserAuthRepository(
      userStore: getIt<UserStore>(),
      networkService: getIt<NetworkService>(),
    ),
  );
}
