import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

class custElevatedButton extends StatelessWidget {
  custElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.buttonName,
      this.buttonColor = customBlue,
      this.buttonHeight = 50,
      this.buttonWidth = 120,
      this.buttonBorderRadius = 18})
      : super(key: key);
  Color buttonColor;
  Function() onPressed;
  Widget buttonName;
  double buttonHeight;
  double buttonWidth;
  double buttonBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                ))),
            child: buttonName),
      ),
    );
  }
}
