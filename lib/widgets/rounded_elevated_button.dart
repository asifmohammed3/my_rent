import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

class RoundedElevatedButton extends StatelessWidget {
  double borderRadius;

  RoundedElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.buttonTitle,
      this.borderRadius = 18,
      this.buttonColor = customBlue})
      : super(key: key);
  Function() onPressed;
  String buttonTitle;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonTitle),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ))));
  }
}
