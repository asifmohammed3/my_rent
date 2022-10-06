import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

class CustTextFieldContainer extends StatelessWidget {
  CustTextFieldContainer(
      {Key? key,
      required this.textFieldName,
      this.textFieldHeight = 50,
      this.maxLines = 1,
      this.hintText = "",
      required this.controller,
      this.validator,
      this.keyboardType,this.onChanged})
      : super(key: key);
  String textFieldName;
void Function(String)? onChanged;

  int maxLines;
  double textFieldHeight;
  String hintText;
  TextEditingController controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;
    var kHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: kWidth,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: 100,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    textFieldName,
                    style: TextStyle(fontSize: 13, color: customBlue),
                  ),
                ),
                Text(":")
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: 220,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                onChanged:onChanged,
                keyboardType: keyboardType,
                controller: controller,
                maxLines: maxLines,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    hintText: hintText,
                    fillColor: textFieldwhite),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
