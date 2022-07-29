import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/screens/property_overview/widgets/carousel_tile.dart';
import 'package:my_rent/screens/property_overview/widgets/selection_dropdown.dart';
import 'package:my_rent/widgets/cust_appbar.dart';

class ScreenPropertyOverview extends StatefulWidget {
  ScreenPropertyOverview({Key? key}) : super(key: key);

  @override
  State<ScreenPropertyOverview> createState() => _ScreenPropertyOverviewState();
}

class _ScreenPropertyOverviewState extends State<ScreenPropertyOverview> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;

    var kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Container(
            // color: Colors.red,
            height: kHeight * 1.8 / 4,
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
                          Color.fromARGB(240, 14, 76, 149),
                          Color.fromARGB(230, 50, 108, 175),
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
                    child: PropertyCarouselSlider())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
