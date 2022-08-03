import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/screens/property_overview/widgets/property_carousal_slider.dart';
import 'package:my_rent/screens/property_overview/widgets/selection_dropdown.dart';
import 'package:my_rent/widgets/cust_appbar.dart';

class ScreenPropertyOverviewMain extends StatefulWidget {
  ScreenPropertyOverviewMain({Key? key}) : super(key: key);

  @override
  State<ScreenPropertyOverviewMain> createState() =>
      _ScreenPropertyOverviewState();
}

class _ScreenPropertyOverviewState extends State<ScreenPropertyOverviewMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;

    var kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldWhite,
      key: _scaffoldKey,
      body: Column(
        children: [
          Container(
            // color: Colors.red,
            height: kHeight * 1.6 / 4,
            child: Stack(
              children: [
                Container(
                  width: kWidth,
                  height: kHeight * 1.3 / 4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromARGB(255, 14, 76, 149),
                          Color.fromARGB(255, 50, 108, 175),
                        ]),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -10,
                  child: Image.asset(
                    "assets/images/header_logo_overview.png",
                    scale: 2.9,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 4,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                    ),
                    color: Colors.white,
                    onPressed: (() {
                      print("${vehicleSelected}${propertySelected}");

                      RootScaffold.openDrawer(context);
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SelectionDropDown(),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 225,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return PropertyCarousalSlider();
                          },
                        )))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(250, 250, 250, 250),
                          border: Border.all(
                              width: 1.5, color: Colors.grey.shade300),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg_images/unit_door.svg"),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Unit 1",
                            style: TextStyle(
                                color: customBlue,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(229, 229, 229, 229),
                  border: Border.all(width: 1.5, color: Colors.yellow.shade200),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Today's Collection",
                        style: TextStyle(
                            color: customBlue,
                            fontSize: 13,
                            letterSpacing: 0.1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "₹ 15000",
                        style:
                            TextStyle(color: pieChartEmptyColor2, fontSize: 17),
                      )
                    ],
                  )),
                  VerticalDivider(
                    endIndent: 4,
                    indent: 4,
                    thickness: 1.5,
                    color: Colors.yellow.shade100,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "This Month's Collection",
                        style: TextStyle(
                            color: customBlue,
                            fontSize: 13,
                            letterSpacing: 0.1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "₹ 15000",
                        style:
                            TextStyle(color: pieChartEmptyColor2, fontSize: 17),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
