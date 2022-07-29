import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/global_variables/global.dart';

class SelectionDropDown extends StatefulWidget {
  SelectionDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectionDropDown> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<SelectionDropDown> {
  // Initial Selected Value
  String dropdownvalue = 'Property';

  // List of items in our dropdown menu
  var items = [
    'Property',
    'Vehicles',
  ];

  @override
  Widget build(BuildContext context) {
    if (vehicleSelected && !propertySelected) {
      return SizedBox();
    } else if (propertySelected && !vehicleSelected) {
      return SizedBox();
    } else {
      return DropdownButton(
        // Initial Value
        value: dropdownvalue,
        underline: SizedBox(), elevation: 50,
        dropdownColor: Color.fromARGB(240, 14, 76, 149),

        borderRadius: BorderRadius.circular(15),

        // Down Arrow Icon
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),

        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            enabled: true,
            child: Text(
              items,
              style: TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            print("${vehicleSelected}${propertySelected}");
            dropdownvalue = newValue!;

            //refresh app to change vehicle part and prop
          });
        },
      );
    }
  }
}
