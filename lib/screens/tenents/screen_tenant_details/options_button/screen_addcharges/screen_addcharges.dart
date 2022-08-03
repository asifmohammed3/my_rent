import 'package:flutter/material.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/screen_addcharges/widgets/reason_dropdown.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddCharges extends StatefulWidget {
  ScreenAddCharges({Key? key}) : super(key: key);

  @override
  State<ScreenAddCharges> createState() => _ScreenAddChargesState();
}

class _ScreenAddChargesState extends State<ScreenAddCharges> {
  TextEditingController unitNumberController = TextEditingController();
  TextEditingController depositAmountController = TextEditingController();
  TextEditingController monthlyRentalController = TextEditingController();
  TextEditingController currentPayableController = TextEditingController();
  TextEditingController additionalAmountController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: "Add Charges",
          ),
        ),
        body: Column(
          children: [
            //-------Add charges textfields-------
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              margin: EdgeInsets.all(10),
              child: ListView(children: [
                CustTextFieldContainer(
                  textFieldName: "Unit Number",
                  controller: unitNumberController,
                ),
                CustTextFieldContainer(
                    textFieldName: "Deposit Amount",
                    controller: depositAmountController),
                CustTextFieldContainer(
                    textFieldName: "Monthly Rental",
                    controller: monthlyRentalController),
                CustTextFieldContainer(
                  textFieldName: "Current Payable",
                  controller: currentPayableController,
                ),
                CustTextFieldContainer(
                    textFieldName: "Additional Amount",
                    controller: additionalAmountController),
                CustTextFieldContainer(
                    textFieldName: "Total Amount",
                    controller: totalAmountController),
                ReasonDropdownWidget(textFieldName: "Reason"),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: CustTextFieldContainer(
                    textFieldName: "Description",
                    hintText: "Enter Remark",
                    controller: descriptionController,
                    maxLines: 8,
                  ),
                ),
              ]),
            ),
            //------submit button------
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
