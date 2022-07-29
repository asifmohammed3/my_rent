import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

class CustSubTitle extends StatelessWidget {
  CustSubTitle(
      {Key? key,
      required this.subtitle,
      this.paddingTop = 70,
      this.fontsize = 20,
      this.color = customBlue,
      this.fontWeight = FontWeight.w400})
      : super(key: key);
  String subtitle;
  double paddingTop;
  Color color;
  double fontsize;
  FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Container(
        margin: EdgeInsets.only(left: 7),
        child: Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color, fontSize: fontsize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
