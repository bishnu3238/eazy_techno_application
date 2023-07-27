import 'package:flutter/material.dart';

import '../../package/package/package.dart';

class ImageShower extends StatelessWidget {
  final String imageUrl;
  final bool isLocal;
  final double borderRadius;
  final BoxFit fit;
  final double? width;
  final double? height;

  const ImageShower({
    super.key,
    required this.imageUrl,
    this.isLocal = false,
    this.borderRadius = 10,
    this.fit = BoxFit.fill,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: isLocal
          ? ShowLocalImage(
              imageUrl: imageUrl, fit: fit, width: width, height: height)
          : ShowNetImage(
              imageUrl: imageUrl, fit: fit, width: width, height: height),
    );
  }
}
