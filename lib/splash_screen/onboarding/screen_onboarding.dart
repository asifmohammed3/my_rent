import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/screen_main_page.dart';
import 'package:my_rent/splash_screen/onboarding/screen_main_splash.dart';
import 'package:my_rent/splash_screen/welcome_screen/screen_welcome.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

class ScreenOnboarding extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenOnboarding> {
  PageController controller = PageController();

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  final List<Widget> list = <Widget>[
    Pages(
        imgSrc: 'assets/svg_images/onboarding/vehicles_onboard.svg',
        mainTitle: "Manage Vehicle rents !",
        subTitle:
            "If you’re looking for a one stop to manage\n your vehicle rentals, you are at the right app"),
    Pages(
        imgSrc: 'assets/svg_images/onboarding/property_onboard.svg',
        mainTitle: "Manage Property rents !",
        subTitle:
            "If you’re looking for a one stop to manage \nall your property rentals, you are at the right app"),
    Pages(
        imgSrc: 'assets/svg_images/onboarding/finance_onboard.svg',
        mainTitle: "Keep track of your finances",
        subTitle:
            "If you’re looking for a one stop to manage \nall your property rentals, you are at the right app"),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;

    var kHeight = MediaQuery.of(context).size.height;

    

    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 14, 76, 149),
                Color.fromARGB(250, 50, 108, 175),
              ]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: kWidth,
                  height: kHeight * 2.1 / 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(38.0),
                      topLeft: Radius.circular(38.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                right: 0,
                left: 0,
                child: Align(
                  child: Image.asset('assets/images/myrent_logo1.png'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 150.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
              ),
              Container(
                child: PageView(
                  children: list,
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true, // reverse: true,
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  onPageChanged: (num) {
                    setState(() {
                      selectedIndex = num;
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: custElevatedButton(
                    onPressed: () {
                      print("pressed");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return ScreenWelcome();
                      }));
                    },
                    buttonName: Text("Continue"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Pages extends StatelessWidget {
  Pages(
      {required this.imgSrc, required this.mainTitle, required this.subTitle});
  String imgSrc;
  String mainTitle;

  String subTitle;

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;

    var kHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: -70,
            right: 0,
            left: 0,
            bottom: 40,
            child: SvgPicture.asset(imgSrc, fit: BoxFit.scaleDown),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 280.0),
              child: CustSubTitle(
                subtitle: mainTitle,
                paddingTop: 0,
                fontsize: 25,
                color: textcustomBlue,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 210.0),
              child: Container(
                width: kWidth * 0.9,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustSubTitle(
                    subtitle: subTitle,
                    paddingTop: 0,
                    fontsize: 14,
                    color: textcustomBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _indicator(bool isActive) {
  return Container(
    margin: EdgeInsets.all(5),
    child: Container(
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: AnimatedContainer(
          constraints: BoxConstraints(maxHeight: 5),
          duration: Duration(milliseconds: 150),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: isActive ? 10 : 8.0,
          width: isActive ? 12 : 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: isActive ? customBlue : Color(0XFFEAEAEA),
          ),
        ),
      ),
    ),
  );
}
