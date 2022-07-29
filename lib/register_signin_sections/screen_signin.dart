import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/register_signin_sections/screen_register.dart';
import 'package:my_rent/register_signin_sections/widgets/sign_up_in_textfield.dart';
import 'package:my_rent/screens/screen_main_page.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';
import 'package:my_rent/widgets/cust_textbutton.dart';

class ScreenSignIn extends StatelessWidget {
  ScreenSignIn({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 150),
        child: FloatingActionButton(
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          backgroundColor: customBlue,
          onPressed: (() {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return ScreenMainPage();
            }));
          }),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            // color: Colors.red,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: -160,
                  bottom: -70,
                  child: Transform.rotate(
                      angle: -math.pi / 3.5,
                      child: Container(
                        decoration: BoxDecoration(
                            color: bottomNavYellow,
                            borderRadius: BorderRadius.circular(12)),
                        height: 350,
                        width: 200,
                      )),
                ),
                Positioned(
                  left: -80,
                  bottom: 70,
                  child: Transform.rotate(
                      angle: -math.pi / 3.5,
                      child: Container(
                        decoration: BoxDecoration(
                            color: customBlue,
                            borderRadius: BorderRadius.circular(12)),
                        height: 500,
                        width: 210,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 40),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset("assets/images/myrent_logo1.png")),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 18),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: CustSubTitle(
                          subtitle: "Sign In",
                          fontWeight: FontWeight.w600,
                          fontsize: 25,
                          paddingTop: 0,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SignUpInTextField(
                      hintText: "Email",
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SignUpInTextField(
                      obscureText: true,
                      hintText: "Password",
                      controller: passwordController,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                color: pieChartEmptyColor,
                                decoration: TextDecoration.underline),
                          ),
                          Container(
                            width: 150,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ScreenRegister();
                                }));
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: customBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: customBlue, width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
