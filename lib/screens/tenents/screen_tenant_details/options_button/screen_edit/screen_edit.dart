import 'package:flutter/material.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/cust_textbutton.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenEditTenantDetails extends StatelessWidget {
  ScreenEditTenantDetails({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController contactNumController = TextEditingController();
  TextEditingController preposeController = TextEditingController();
//TODO upload img  (not a text field)
  TextEditingController IdController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: "Edit Tenant Details",
          ),
        ),
        body: Column(
          children: [
            //-------edit tenant textfields-------
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              margin: EdgeInsets.all(10),
              child: ListView(children: [
                CustTextFieldContainer(
                  textFieldName: "Name",
                  controller: nameController,
                ),
                CustTextFieldContainer(
                    textFieldName: "Contact No",
                    controller: contactNumController),
                CustTextFieldContainer(
                    textFieldName: "Prepose of Rent",
                    controller: preposeController),
                CustTextFieldContainer(
                  textFieldName: "ID Proof",
                  controller: IdController,
                ),
                CustTextFieldContainer(
                  textFieldName: "Description",
                  hintText: "Add Note",
                  controller: descriptionController,
                  maxLines: 8,
                ),
              ]),
            ),
            //------update button------
            RoundedElevatedButton(
              onPressed: () {},
              buttonTitle: "Submit",
              borderRadius: 12,
            )
          ],
        ),
      ),
    );
  }
}
