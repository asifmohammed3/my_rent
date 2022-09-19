import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/tenents/tenant_widgets/tenant_pic.dart';

class StaffTile extends StatelessWidget {
  StaffTile({
    Key? key,
    required this.staffName,
    required this.mobileNumber,
    required this.roleOfStaff,
  }) : super(key: key);

  String staffName;
  String mobileNumber;
  String roleOfStaff;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(50, 175, 175, 175),
              blurRadius: 10.0,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 10,
          ),
          TenantPic(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: $staffName",
                  style: TextStyle(fontSize: 13, color: pieChartEmptyColor2),
                ),
                Text(
                  "Name: $mobileNumber",
                  style: TextStyle(fontSize: 13, color: pieChartEmptyColor2),
                ),
                RichText(
                    text: TextSpan(
                        text: "Role  : ",
                        style:
                            TextStyle(fontSize: 13, color: pieChartEmptyColor2),
                        children: [
                      TextSpan(
                        text: "$roleOfStaff",
                        style: TextStyle(
                          fontSize: 13,
                          color: customBlue,
                        ),
                      )
                    ])),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
                height: 2,
                child: IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 25,
                      color: pieChartEmptyColor,
                    ),
                    onPressed: () {})),
          ),
        ]),
      ),
    );
  }
}
