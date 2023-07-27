import 'package:flutter/material.dart';

class ShowLocalImage extends StatelessWidget {
  const ShowLocalImage({
    super.key,
    required this.imageUrl,
    required this.fit,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
