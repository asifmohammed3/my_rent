import 'package:flutter/material.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/widgets/cust_textfield_container.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddComplaints extends StatelessWidget {
  ScreenAddComplaints({Key? key}) : super(key: key);

  TextEditingController categoryController = TextEditingController();
  TextEditingController assignToController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: "Add Complaints",
          ),
        ),
        body: Column(
          children: [
            //-------complaints textfields-------
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              margin: EdgeInsets.all(10),
              child: ListView(children: [
                CustTextFieldContainer(
                  textFieldName: "Category",
                  controller: categoryController,
                ),
                CustTextFieldContainer(
                    textFieldName: "Assign to", controller: assignToController),
                CustTextFieldContainer(
                  textFieldName: "Description",
                  hintText: "Write your Complaint",
                  controller: descriptionController,
                  maxLines: 8,
                ),
              ]),
            ),
            //------submit button------
            RoundedElevatedButton(
              onPressed: () {},
              buttonTitle: "Submit Complaints",
              borderRadius: 12,
            )
          ],
        ),
      ),
    );
  }
}
