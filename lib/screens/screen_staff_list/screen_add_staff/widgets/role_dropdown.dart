import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

// Initial Selected Value

String roledropdownvalue = 'Owner';

// List of items in our dropdown menu
var items = [
  'Owner',
  'type2',
  'type3',
];

class RoleDropdownWidget extends StatefulWidget {
  RoleDropdownWidget({
    Key? key,
    required this.textFieldName,
  }) : super(key: key);

  String textFieldName;
  @override
  State<RoleDropdownWidget> createState() =>
      _ReasonDropdownWidgetState(textFieldName: textFieldName);
}

class _ReasonDropdownWidgetState extends State<RoleDropdownWidget> {
  _ReasonDropdownWidgetState({required this.textFieldName});

  String textFieldName;

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
          child: Container(
            margin: EdgeInsets.all(10),
            child: SizedBox(
              width: 100,
              child: Container(
                child: DropdownButton(
                  // Initial Value
                  value: roledropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      roledropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
