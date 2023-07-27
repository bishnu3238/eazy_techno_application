import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../app_constants/app_constant.dart';

class LoadingSpinner extends StatelessWidget {
  final Color color;
  final double size;
  const LoadingSpinner({Key? key, this.color = kFourthColor, this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: spinner(color, size),
        ),
      ),
    );
  }
}

Widget spinner(Color color, double size) =>
    LoadingAnimationWidget.inkDrop(color: color, size: size);
