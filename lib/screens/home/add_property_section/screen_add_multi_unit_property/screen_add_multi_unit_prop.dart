import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/widgets/cust_textfield_container.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/cust_textbutton.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddMultiUnitProperty extends StatelessWidget {
  ScreenAddMultiUnitProperty({Key? key}) : super(key: key);

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController noOfRoomController = TextEditingController();
//TODO upload img  (not a text field)
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: "Add Property",
          ),
        ),
        body: Column(
          children: [
            //------- textfields-------
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              margin: EdgeInsets.all(10),
              child: ListView(children: [
                CustTextFieldContainer(
                  textFieldName: "Property Name",
                  controller: propertyNameController,
                ),
                CustTextFieldContainer(
                    textFieldName: "No. of Rooms",
                    controller: noOfRoomController),
                CustTextFieldContainer(
                    textFieldName: "Image", controller: imageController),
              ]),
            ),
            //------Add button------
            RoundedElevatedButton(
              onPressed: () {},
              buttonTitle: "Add",
              buttonColor: bottomNavYellow,
              borderRadius: 12,
            )
          ],
        ),
      ),
    );
  }
}
