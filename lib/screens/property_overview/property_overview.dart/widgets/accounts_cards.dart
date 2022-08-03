import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

class AccountCards extends StatelessWidget {
  AccountCards(
      {Key? key,
      required this.boxColor,
      required this.textColor,
      required this.title,
      required this.collectionAmount})
      : super(key: key);
  Color boxColor;
  String title;
  String collectionAmount;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 100,
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  TextStyle(color: textColor, fontSize: 13, letterSpacing: 0.1),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "₹ ${collectionAmount}",
              style: TextStyle(color: textColor, fontSize: 17),
            )
          ],
        ),
      ),
    ));
  }
}
