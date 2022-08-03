import 'package:flutter/material.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddServices extends StatelessWidget {
  ScreenAddServices({Key? key}) : super(key: key);

  TextEditingController unitNumberController = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();
  TextEditingController serviceFeeController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: "Add Services",
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
                  textFieldName: "Unit Number",
                  controller: unitNumberController,
                ),
                CustTextFieldContainer(
                    textFieldName: "Service Type",
                    controller: serviceTypeController),
                CustTextFieldContainer(
                    textFieldName: "Service Fee",
                    controller: serviceFeeController),
                CustTextFieldContainer(
                  textFieldName: "Remarks",
                  hintText: "Enter Remarks",
                  controller: remarksController,
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
