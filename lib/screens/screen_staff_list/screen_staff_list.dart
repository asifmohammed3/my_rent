import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/screen_staff_list/screen_add_staff/screen_add_staff.dart';
import 'package:my_rent/screens/screen_staff_list/screen_add_staff/widgets/role_dropdown.dart';
import 'package:my_rent/screens/screen_staff_list/widgets/staff_tile.dart';
import 'package:my_rent/widgets/cust_appbar.dart';
import 'package:my_rent/widgets/drawer_section/cust_drawer.dart';

class ScreenStaffList extends StatefulWidget {
  const ScreenStaffList({Key? key}) : super(key: key);

  @override
  State<ScreenStaffList> createState() => _ScreenStaffState();
}

class _ScreenStaffState extends State<ScreenStaffList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: scaffoldWhite,
          key: _scaffoldKey,
          drawer: CustDrawer(),
          appBar: CustAppBar(
            scaffoldKey: _scaffoldKey,
            title: 'Staff List',
          ),
          extendBody: true,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenAddStaff();
                  }));
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
                      "Add Staff",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ]),
                ),
              ),
            ),
          ),
          body: Container(
              margin: EdgeInsets.only(
                right: 15,
                left: 15,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Row(children: [
                        Icon(Icons.people_outline),
                        Text("Total Staff: {count}")
                      ]),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        StaffTile(
                            staffName: "Asif",
                            mobileNumber: "9876450321",
                            roleOfStaff: "Owner"),
                        StaffTile(
                            staffName: "Asif",
                            mobileNumber: "9876450321",
                            roleOfStaff: "Owner")
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
