import 'package:flutter/material.dart';

import '../../app_constants/app_constant.dart';

InputDecoration inputFieldDecoration({
  String hint = '',
  String label = '',
  Widget? prefix,
  Widget? suffix,
  Widget? counter,
  double radius = 12,
  Color borderColor = kPrimeColor,
  Color errorBorderColor = kRed,
  Color disableBorderColor = kGreyForm,
}) {
  return InputDecoration(
    isDense: true,
    hintText: hint,
    counter: counter,
    labelText: label,
    prefixIcon: prefix,
    suffixIcon: suffix,
    alignLabelWithHint: true,
    contentPadding: const EdgeInsets.all(15),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: disableBorderColor),
        borderRadius: BorderRadius.circular(radius)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(radius)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(radius)),
    prefixIconConstraints: const BoxConstraints(
      maxWidth: 150,
      maxHeight: 50,
      minWidth: 35,
      minHeight: 35,
    ),
  );
}

InputDecoration borderInputDecoration({
  required BuildContext context,
  String? hint,
  String? label,
  Widget? prefix,
  Widget? suffix,
  double? radius = 12,
  Color? borderColor = kDBlue,
}) {
  return InputDecoration(
    alignLabelWithHint: true,
    prefixIconConstraints: const BoxConstraints(
        maxWidth: 150, maxHeight: 50, minWidth: 38, minHeight: 38),
    prefixIcon: prefix,
    suffixIcon: suffix,
    hintStyle: Theme.of(context).textTheme.bodySmall,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: label,
    hintText: hint,
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kDBlue),
        borderRadius: BorderRadius.circular(radius!)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor!),
        borderRadius: BorderRadius.circular(radius)),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
  );
}
