import 'package:dartz/dartz.dart';
import '../../app_constants/app_constant.dart';
import '../failures/failure.dart';
import '../stores/store.dart';

class UpdateThemeUseCase {
  final ThemeStore _themeStore;
  UpdateThemeUseCase(this._themeStore);

  void execute(ThemeType themeType) => _themeStore.setTheme(themeType);
}
