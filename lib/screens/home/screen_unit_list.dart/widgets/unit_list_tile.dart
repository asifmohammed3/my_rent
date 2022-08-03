import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/screen_unit_asset_data/screen_unit_asset_data.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

class unitListTile extends StatelessWidget {
  unitListTile(
      {Key? key,
      required this.unitName,
      required this.currentTenant,
      required this.unitStatus,
      required this.agreeRenewDate})
      : super(key: key);

  String unitName;
  String currentTenant;
  String agreeRenewDate;
  String unitStatus;

  Color statusColor() {
    if (unitStatus == "Occupied") {
      return Color.fromARGB(255, 128, 182, 74);
    } else if (unitStatus == "Vacant") {
      return Color.fromARGB(255, 216, 0, 0);
    } else
      return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ScreenUnitAssetData(
            unitName: unitName,
            currentTenant: currentTenant,
            unitStatus: unitStatus,
            agreeRenewDate: agreeRenewDate,
            statusColor: statusColor(),
          );
        }));
      },
      child: Padding(
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: statusColor(),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.home,
                    size: 45,
                    color: statusColor(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustSubTitle(
                    subtitle: unitName,
                    paddingTop: 0,
                    fontsize: 18,
                  ),
                  Text(
                    "Current Tenant: $currentTenant",
                    style: TextStyle(fontSize: 13, color: pieChartEmptyColor2),
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Current Status: ",
                          style: TextStyle(
                              fontSize: 13, color: pieChartEmptyColor2),
                          children: [
                        TextSpan(
                          text: "$unitStatus",
                          style: TextStyle(
                            fontSize: 13,
                            color: statusColor(),
                          ),
                        )
                      ])),
                  Text(
                    "Agreement Renews on $agreeRenewDate",
                    style: TextStyle(fontSize: 11, color: pieChartEmptyColor2),
                  ),
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
      ),
    );
  }
}
