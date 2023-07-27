import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import '../../app_constants/app_constant.dart';

final light = FlexThemeData.light(appBarBackground: kLight);
// ThemeData.light(useMaterial3: true);
/// ThemeData(
//   colorSchemeSeed: kPrimeColor,
//
//   // app bar theme_store;
//   appBarTheme: AppBarTheme(
//     elevation: 0,
//     backgroundColor: kLight,
//     foregroundColor: kLight,
//     scrolledUnderElevation: 1,
//     titleTextStyle: GoogleFonts.poppins(
//       color: kDark,
//       fontWeight: FontWeight.w600,
//       fontSize: 18,
//     ),
//     systemOverlayStyle: const SystemUiOverlayStyle(
//       statusBarColor: kLight,
//       statusBarIconBrightness: Brightness.dark,
//       statusBarBrightness: Brightness.dark,
//     ),
//   ),
//
//   // bottom navigation bar theme_store;
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     unselectedItemColor: kGrey,
//     backgroundColor: kBackground,
//     selectedItemColor: kTitleColor,
//     type: BottomNavigationBarType.fixed,
//     unselectedLabelStyle: GoogleFonts.arya(),
//     selectedLabelStyle: GoogleFonts.arya(),
//   ),
// );
final dark = FlexThemeData.dark()
  ..iconTheme.copyWith(color: kLight)
  ..appBarTheme.copyWith(
      iconTheme: IconThemeData(color: kLight),
      actionsIconTheme: IconThemeData(color: Colors.red));
// ThemeData.dark(
//   useMaterial3: true,
//   // bottomNavigationBarTheme: BottomNavigationBarThemeData(
//   //   unselectedItemColor: kGrey,
//   //   backgroundColor: kBackground,
//   //   selectedItemColor: kTitleColor,
//   //   type: BottomNavigationBarType.fixed,
//   //   unselectedLabelStyle: GoogleFonts.arya(),
//   //   selectedLabelStyle: GoogleFonts.arya(),
//   // ),
// );
// GoogleFonts.notoSansCaucasianAlbanian(),
