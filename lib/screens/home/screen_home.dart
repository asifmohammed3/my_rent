import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/add_property_section/add_property_popup.dart';
import 'package:my_rent/screens/home/widgets/property_tile.dart';
import 'package:my_rent/widgets/cust_appbar.dart';
import 'package:my_rent/widgets/drawer_section.dart/cust_drawer.dart';
import 'package:my_rent/widgets/cust_searchbar.dart';
import 'package:my_rent/widgets/pie_chart.dart';
import 'package:pie_chart/pie_chart.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldWhite,
        key: _scaffoldKey,
        drawer: const PreferredSize(
            preferredSize: Size.fromHeight(50.0), child: CustDrawer()),
        appBar: CustAppBar(
          scaffoldKey: _scaffoldKey,
          title: 'Property List',
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 90.0),
          child: SizedBox(
            width: 122,
            height: 52,
            child: FloatingActionButton(
              backgroundColor: customBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              onPressed: () {
                showAddropertyPopup(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(children: const [
                  Icon(
                    Icons.add,
                    size: 21,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Add Property",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ]),
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: Stack(
            children: [
              CustSearchBar(),
              // Padding(
              //     padding: EdgeInsets.only(top: 60),
              //     child: ListView.builder(
              //       itemCount: 4,
              //       itemBuilder: (context, index) {
              //         return PropertyTile(
              //           propertyName: "Property ${index}",
              //           branchLocation: "Location ${index}",
              //           numberOfUnits: "4",
              //           imageSrc:
              //               "https://www.nobroker.in/blog/wp-content/uploads/2021/03/buying-residential.jpg",
              //         );
              //       },
              //     )),
            ],
          ),
        ));
  }
}
