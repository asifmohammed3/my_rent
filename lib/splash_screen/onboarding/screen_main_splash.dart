import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'dart:async';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/constants/styles.dart';
import 'package:my_rent/firebase/functions.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/screens/screen_main_page.dart';
import 'package:my_rent/splash_screen/onboarding/screen_onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // updateRole();
    // processSignUp();
    // print("called cloud function");

    Timer(Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user == null) {
          print('User is currently signed out!');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => ScreenOnboarding()),
              (route) => false);
        } else {
          print('User is signed in!');
          // print(FirebaseAuth.instance.currentUser!.getIdToken());
          updateToken(user.getIdToken());
          // tokenID = user.getIdToken();

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => ScreenMainPage()),
              (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
