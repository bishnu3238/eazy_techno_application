import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../app_constants/app_constant.dart';
import '../../../package/package/package.dart';

class ThemeStore extends HydratedCubit<ThemeType> {
  ThemeStore() : super(ThemeType.light);

  void setTheme(ThemeType themeType) => emit(themeType);

  @override
  ThemeType? fromJson(Map<String, dynamic> json) =>
      (json[themeTypeKey] as String).theme;

  @override
  Map<String, dynamic>? toJson(ThemeType state) => {themeTypeKey: state.name};
}
