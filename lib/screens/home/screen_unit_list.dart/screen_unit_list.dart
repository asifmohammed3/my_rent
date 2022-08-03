import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/register_signin_sections/authentication/authentication.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/screens/home/add_property_section/add_property_popup.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/screen_add_unit/screen_add_unit.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/widgets/unit_list_header_tile.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/widgets/unit_list_tile.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/widgets/vacant_occupied_count_sec.dart';
import 'package:my_rent/screens/home/widgets/property_tile.dart';
import 'package:my_rent/widgets/bottom_nav_widget.dart';
import 'package:my_rent/widgets/cust_appbar.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';
import 'package:my_rent/widgets/drawer_section.dart/cust_drawer.dart';
import 'package:my_rent/widgets/cust_searchbar.dart';
import 'package:my_rent/widgets/pie_chart.dart';
import 'package:pie_chart/pie_chart.dart';

class ScreenUnitList extends StatefulWidget {
  const ScreenUnitList({Key? key}) : super(key: key);

  @override
  State<ScreenUnitList> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenUnitList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldWhite,
        key: _scaffoldKey,
        drawer: const PreferredSize(
            preferredSize: Size.fromHeight(50.0), child: CustDrawer()),
        appBar: CustAppBar(
          scaffoldKey: _scaffoldKey,
          title: 'Unit List',
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
                //navigate to add unit page
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return ScreenAddUnit();
                })));
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Row(children: const [
                    Icon(
                      Icons.add,
                      size: 21,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Add Unit",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              //header tile
              unitListHeaderTile(
                  "https://www.nobroker.in/blog/wp-content/uploads/2021/03/buying-residential.jpg",
                  "Property Name",
                  "Branch Location"),

              // no of vacant occuppied circle dot section
              vacantOccupiedCountSec("1", "0"),

              //Unit tile lists
              unitListTile(
                unitName: "Unit 1",
                currentTenant: "Tenant 1",
                unitStatus: "Vacant", //"Occupied"  or "Vacant"
                agreeRenewDate: "30/11/2023",
              )
            ],
          ),
        ),
      ),
    );
  }
}