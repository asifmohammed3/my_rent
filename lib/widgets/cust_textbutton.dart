import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

class CustTextButton extends StatelessWidget {
  CustTextButton({Key? key, required this.buttonName, required this.onPressed})
      : super(key: key);
  Function()? onPressed;
  String buttonName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: textFieldwhite,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        width: 300,
        height: 40,
        child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
          ),
          child: Text(
            buttonName,
            style: TextStyle(color: customBlue),
          ),
        ),
      ),
    );
  }
}
