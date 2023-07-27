import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../app_constants/app_constant.dart';


class IntroBody extends StatelessWidget {
  const IntroBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(gradient: introGradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            appName,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Loading",
              ),
              const SizedBox(width: 10),
              LoadingAnimationWidget.discreteCircle(
                  color: Colors.white, size: 10),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Please Wait"),
                const SizedBox(width: 10),
                LoadingAnimationWidget.threeRotatingDots(
                    size: 12, color: Colors.purpleAccent),
              ],
            ),
          )
        ],
      ),
    );
  }
}
