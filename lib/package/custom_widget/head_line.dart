import 'package:eazy_techno_application/app_constants/app_constant.dart';
import 'package:flutter/material.dart';

class HeadLine extends StatelessWidget {
  final String headline;
  final Widget? button;
  final Color? color;
  const HeadLine({
    super.key,
    this.button,
    this.color = kLight,
    required this.headline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.fromLTRB(10, 8, 5, 5),
      color: color,
      child: Row(
        children: [
          Text(headline),
          const Spacer(),
          button ?? const SizedBox(),
        ],
      ),
    );
  }
}
