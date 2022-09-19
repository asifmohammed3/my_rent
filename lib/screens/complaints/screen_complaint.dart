import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/complaints/widgets/complaint_tile.dart';
import 'package:my_rent/widgets/cust_appbar.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';
import 'package:my_rent/widgets/drawer_section/cust_drawer.dart';

class ScreenComplaint extends StatefulWidget {
  const ScreenComplaint({Key? key}) : super(key: key);

  @override
  State<ScreenComplaint> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenComplaint> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldWhite,
      key: _scaffoldKey,
      drawer: CustDrawer(),
      appBar: CustAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Complaint List',
      ),
      body: Container(
        // color: Colors.green,
        margin: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 65,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustSubTitle(subtitle: "Total Complaints : 2", paddingTop: 0),
                  SizedBox(
                    width: 65,
                    child: Row(
                      children: const [
                        Text(
                          "Filter",
                          style: TextStyle(color: customBlue),
                        ),
                        Icon(
                          Icons.sort,
                          color: customBlue,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ComplaintTile(
                      category: "Ac",
                      date: "20-07-22",
                      status: "Registered",
                      description: "Please check as soon as possible",
                      imageSrc:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"),
                  // ComplaintTile(
                  //       category: "Ac",
                  //       date: "24-07-22",
                  //       status: "Not Registered",
                  //       description: "Please check as soon as possible",
                  //       imageSrc:
                  //           "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
