import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

class RegisterTextfield extends StatefulWidget {
  RegisterTextfield(
      {Key? key,
      required this.controller,
      required this.title,
      this.validator,
      this.onChanged,
      this.readOnly= false,
      this.maxLines = 1})
      : super(key: key);
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  final TextEditingController controller;
  final String title;
  final int maxLines;
  bool readOnly ;

  @override
  State<RegisterTextfield> createState() => _RegisterTextfieldState();
}

class _RegisterTextfieldState extends State<RegisterTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly:widget.readOnly,
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.controller,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        labelText: widget.title,
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
