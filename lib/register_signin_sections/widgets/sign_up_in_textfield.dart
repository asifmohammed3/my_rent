import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

class SignUpInTextField extends StatelessWidget {
  SignUpInTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.validator,this.onChanged,
      this.obscureText = false})
      : super(key: key);
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  bool obscureText;
  String hintText;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          controller: controller,
          cursorColor: customBlue,
          cursorRadius: Radius.circular(20),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 1,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: customBlue),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: customBlue, width: 2.2),
            ),
          ),
        ));
  }
}
