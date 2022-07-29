import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/constants/styles.dart';
import 'package:my_rent/splash_screen/onboarding/screen_onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ScreenOnboarding();
        }));
      },
      child: Stack(
        children: [
          Positioned(
            left: -40,
            bottom: -15,
            child: Transform.rotate(
                angle: math.pi / 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: bottomNavYellow,
                      borderRadius: BorderRadius.circular(12)),
                  height: 350,
                  width: 215,
                )),
          ),
          Positioned(
            right: -60,
            top: 95,
            child: Transform.rotate(
                angle: math.pi / 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: customBlue,
                      borderRadius: BorderRadius.circular(12)),
                  height: 400,
                  width: 215,
                )),
          ),
          Positioned(
              bottom: 380,
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset("assets/images/splash_logo.png")),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Text(
                "A perfect app to manage your rentals",
                style: TextStyle(
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Color.fromARGB(220, 95, 95, 95),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
