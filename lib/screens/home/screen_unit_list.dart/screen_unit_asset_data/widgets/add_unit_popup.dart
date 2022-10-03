import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/add_property_section/screen_add_single_unit_property/screen_add_single_unit_prop.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';

showAddUnitPopup(BuildContext context) {
  TextEditingController itemNameController = TextEditingController();

  TextEditingController itemCountController = TextEditingController();
  const subTitleStyle = TextStyle(
    fontSize: 13,
    color: Color.fromARGB(255, 95, 95, 95),
  );
  // set up the AlertDialog
  AlertDialog showAddUnitPopup = AlertDialog(
    contentPadding: EdgeInsets.all(7),
    title: CustSubTitle(subtitle: "Add Assets", paddingTop: 0),
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          addUnitPopupTextField(itemNameController, "Name", itemNameController),
          addUnitPopupTextField(
              itemNameController, "Quantity", itemCountController),
          custElevatedButton(
            onPressed: () {},
            buttonName: Text("Add"),
            buttonHeight: 40,
            buttonWidth: 80,
          )
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return showAddUnitPopup;
    },
  );
}

Row addUnitPopupTextField(
    TextEditingController itemNameController, String name, controller) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    SizedBox(
      width: 80,
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
                name,
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
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                hintStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                fillColor: textFieldwhite),
          ),
        ),
      ),
    )
  ]);
}
