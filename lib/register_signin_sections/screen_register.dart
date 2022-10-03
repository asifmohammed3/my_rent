import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/main.dart';
import 'package:my_rent/register_signin_sections/authentication/authentication.dart';
import 'package:my_rent/register_signin_sections/screen_register_next.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/register_signin_sections/widgets/sign_up_in_textfield.dart';
import 'package:my_rent/screens/screen_main_page.dart';
import 'package:my_rent/splash_screen/onboarding/screen_main_splash.dart';
import 'package:my_rent/splash_screen/select_prop_or_veh/screen_select_prop_or_veh.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';
import 'package:my_rent/widgets/cust_textbutton.dart';

class ScreenRegister extends StatefulWidget {
  ScreenRegister({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 8.0, bottom: 150),
          child: FloatingActionButton(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            backgroundColor: customBlue,
            onPressed: (() async {
              _formKey.currentState!.validate();
              if (passwordController.text == passConfirmController.text) {
                if (await signUp(
                    emailController.text, passwordController.text)) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return ScreenPropVehSelection();
                  }));
                }
              }
              setState(() {});
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
                            subtitle: "Create Account",
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SignUpInTextField(
                          hintText: "Email",
                          controller: emailController,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SignUpInTextField(
                          obscureText: true,
                          hintText: "Password",
                          controller: passwordController,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            }
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SignUpInTextField(
                          obscureText: true,
                          hintText: "Confirm password",
                          controller: passConfirmController,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          validator: (value) {
                            if (passConfirmController.text !=
                                passwordController.text) {
                              return "Password don't match";
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                child: CustSubTitle(
                                  subtitle: "Next",
                                  fontWeight: FontWeight.w500,
                                  fontsize: 25,
                                  paddingTop: 0,
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Existing User?",
                          style: TextStyle(
                              color: pieChartEmptyColor,
                              decoration: TextDecoration.underline),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return ScreenSignIn();
                            }));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: customBlue,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
