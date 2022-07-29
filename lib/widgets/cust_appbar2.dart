import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

//Appbar widget for inside screens(included back button)
class CustAppBar2 extends StatelessWidget {
  CustAppBar2(
      {Key? key,
      this.icon = Icons.arrow_back_ios,
      required this.title,
      this.textColor = customBlue,
      this.iconColor = customBlue})
      : super(key: key);

  final IconData icon;
  String title;
  Color textColor;
  Color iconColor = customBlue;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          icon: Icon(icon),
          color: iconColor,
          onPressed: () {
            Navigator.of(context).pop();
          }),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
