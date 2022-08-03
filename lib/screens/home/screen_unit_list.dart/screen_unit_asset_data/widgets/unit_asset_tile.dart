import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

class UnitAssetTile extends StatelessWidget {
  UnitAssetTile(
      {Key? key,
      required this.assetName,
      required this.assetCount,
      required this.onPressed})
      : super(key: key);

  String assetName;
  String assetCount;
  dynamic Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.8, color: pieChartEmptyColor),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 11.0),
            child: CustSubTitle(
              subtitle: "$assetName",
              fontWeight: FontWeight.w500,
              fontsize: 18,
              paddingTop: 0,
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "No. of Items",
                  style: TextStyle(color: pieChartEmptyColor2, fontSize: 12),
                ),
                CustSubTitle(
                  subtitle: "$assetCount",
                  fontWeight: FontWeight.w500,
                  fontsize: 18,
                  paddingTop: 0,
                ),
              ],
            ),
          ),
          custElevatedButton(
            onPressed: onPressed,
            buttonName: Text("Move to"),
            buttonBorderRadius: 12,
            buttonWidth: 90,
          )
        ],
      ),
    );
  }
}
