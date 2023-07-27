import 'package:flutter/material.dart';

import '../../../package/package/package.dart';


class IntroLoading extends StatelessWidget {
  final Color? color;
  final double? size;
  const IntroLoading({Key? key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoadingSpinner());
  }
}
