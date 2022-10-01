import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/splash_screen/select_prop_or_veh/screen_select_prop_or_veh.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.52,
            width: double.infinity,
            // color: Colors.red,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: -50,
                  bottom: 200,
                  child: Transform.rotate(
                      angle: -math.pi / 3.8,
                      child: Container(
                        decoration: BoxDecoration(
                            color: bottomNavYellow,
                            borderRadius: BorderRadius.circular(12)),
                        height: 400,
                        width: 300,
                      )),
                ),
                Positioned(
                  left: -100,
                  bottom: 330,
                  child: Transform.rotate(
                      angle: -math.pi / 3.8,
                      child: Container(
                        decoration: BoxDecoration(
                            color: customBlue,
                            borderRadius: BorderRadius.circular(12)),
                        height: 300,
                        width: 350,
                      )),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 18),
                      child: SvgPicture.asset(
                          "assets/svg_images/onboarding/welcome_screen_pic.svg"),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: customBlue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Container(
                    child: Column(children: [
                      custElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return ScreenSignIn();
                          }));
                        },
                        buttonName: Text(
                          "User Login",
                          style: TextStyle(
                              color: customBlue,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        buttonColor: Colors.white,
                        buttonWidth: 200,
                        buttonBorderRadius: 14,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      custElevatedButton(
                        onPressed: () {},
                        buttonName: Text(
                          "Guest Login",
                          style: TextStyle(
                              color: customBlue,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        buttonColor: Colors.white,
                        buttonWidth: 200,
                        buttonBorderRadius: 14,
                      )
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
