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
import 'package:my_rent/widgets/drawer_section/cust_drawer.dart';
import 'package:my_rent/widgets/cust_searchbar.dart';
import 'package:my_rent/widgets/pie_chart.dart';
import 'package:pie_chart/pie_chart.dart';

class ScreenUnitList extends StatefulWidget {
  ScreenUnitList(
      {Key? key, required this.propertyName, required this.branchLocation})
      : super(key: key);
  String propertyName;
  String branchLocation;
  @override
  State<ScreenUnitList> createState() => _ScreenHomeState(
      propertyName: propertyName, branchLocation: branchLocation);
}

class _ScreenHomeState extends State<ScreenUnitList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _ScreenHomeState({required this.propertyName, required this.branchLocation});
  String propertyName;
  String branchLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldWhite,
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
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              //header tile
              unitListHeaderTile(
                  "https://www.nobroker.in/blog/wp-content/uploads/2021/03/buying-residential.jpg",
                  "$propertyName",
                  "$branchLocation"),

              // no of vacant occuppied circle dot section
              vacantOccupiedCountSec("1", "0"),

              //Unit tile lists
              Expanded(
                child: Expanded(
                  child: ListView(
                    children: [
                      unitListTile(
                        unitName: "Unit 1",
                        currentTenant: "Tenant 1",
                        unitStatus: "Vacant", //"Occupied"  or "Vacant"
                        agreeRenewDate: "30/11/2023",
                      ),
                      unitListTile(
                        unitName: "Unit 1",
                        currentTenant: "Tenant 1",
                        unitStatus: "Occupied", //"Occupied"  or "Vacant"
                        agreeRenewDate: "30/11/2023",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//add unit

String addPropertyUnit =
    r""" mutation ADD_PROPERTY_UNIT($area: Int, $bhk: Int, $floor_no: Int, $property_id: uuid, $room_name: String , $room_no: Int, $type: unit_types_enum) {
  insert_property_unit_one(object: {area: $area, bhk: $bhk, floor_no: $floor_no, property_id: $property_id, room_name: $room_name, room_no: $room_no, type: $type}){
    id
  }
} """;
