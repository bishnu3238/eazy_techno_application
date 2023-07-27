import 'package:eazy_techno_application/app_constants/app_constant.dart';
import 'package:flutter/material.dart';

class Notifier {
  errorMessage({required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: kError,
            duration: oneSecond,
          ),
        );
  successMessage({required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: kSuccess,
            duration: oneSecond,
          ),
        );
  infoMessage({required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: kDark.withOpacity(0.5),
            duration: oneSecond,
          ),
        );
}
