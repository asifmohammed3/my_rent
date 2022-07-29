import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

class CustSearchBar extends StatelessWidget {
  const CustSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 22,
              color: customBlue,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: TextStyle(
                color: customBlue, fontWeight: FontWeight.w300, fontSize: 13),
            hintText: "Search Property",
            fillColor: textFieldwhite),
      ),
    );
  }
}
