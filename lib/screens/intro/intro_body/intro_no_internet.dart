 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_constants/app_constant.dart';


class IntroNoInternet extends StatelessWidget {
  const IntroNoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kLight,
          width: media.width,
          height: media.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset('assets/images/empty_items.png'),
              const SizedBox(height: 30),
              Text(
                "No Internet Connection",
                style: GoogleFonts.ubuntu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
