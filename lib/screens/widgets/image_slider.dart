import 'package:eazy_techno_application/app_constants/app_info.dart';
import 'package:eazy_techno_application/app_constants/durations.dart';
import 'package:eazy_techno_application/package/common/screen_utils.dart';
import 'package:flutter/material.dart';

import '../../package/package/package.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imageUrls;
  const ImageSlider({super.key, required this.imageUrls});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> get imageUrls => widget.imageUrls;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getScreenHeight(kLayoutHeight * 1 / 5),
      child: PageView(
        scrollBehavior: const ScrollBehavior(),
        onPageChanged: (int page) => setState(() => currentIndex = page),
        children: imageUrls.map((e) => _buildImage(e)).toList(),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
        // Placeholder or shimmer while image is loading
        // Positioned.fill(
        //   child: Opacity(
        //     opacity: 0.7,
        //     child: Container(
        //       color: Colors.grey, // Customize the color as per your requirement
        //     ),
        //   ),
        // ),
        Positioned(
          bottom: 5,
          child: PageIndicator(
            itemCount: imageUrls.length,
            currentIndex: currentIndex,
          ),
        )
      ],
    );
  }
}
