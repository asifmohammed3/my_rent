import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

Widget expenseDataTable(
  Color indicatorColor,
  String item,
  String expenseAmount,
) {
  return Container(
    height: 15,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        color: indicatorColor,
        height: 10,
        width: 10,
      ),
      Text(
        item,
        style: TextStyle(color: pieChartEmptyColor2, fontSize: 15),
      ),
      Text(
        "₹ ${expenseAmount}",
        style: TextStyle(color: customBlue, fontSize: 15),
      )
    ]),
  );
}
