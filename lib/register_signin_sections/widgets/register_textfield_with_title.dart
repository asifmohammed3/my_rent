import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

class RegisterTextfield extends StatelessWidget {
   RegisterTextfield(
      {Key? key,
      required this.controller,
      required this.title,
      this.maxLines = 1})
      : super(key: key);
  final TextEditingController controller;
  final String title;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: validator,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: title,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelStyle: TextStyle(color: customBlue),
        alignLabelWithHint: true,
        // hintText: 'Enter your name',
        // Enabled Border
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        // Focused Border
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: customBlue, width: 2),
        ),
      ),
    );
  }
}
