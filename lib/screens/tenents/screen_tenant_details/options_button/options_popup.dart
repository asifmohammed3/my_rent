import 'package:flutter/material.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/screen_addcharges/screen_addcharges.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/screen_addservices/screen_addservices.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/screen_complaints/screen_complaints.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/screen_edit/screen_edit.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/screen_printinvoice/screen_printinvoice.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/screen_transactionhistory/screen_transactionhistory.dart';
import 'package:my_rent/widgets/cust_textbutton.dart';

showOptionsPopup(BuildContext context) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    contentPadding: EdgeInsets.all(7),
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustTextButton(
              buttonName: "Edit",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenEditTenantDetails()));
              }),
          CustTextButton(
              buttonName: "History",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenTransactionHistory()));
              }),
          CustTextButton(
              buttonName: "Complaints",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenAddComplaints()));
              }),
          CustTextButton(
              buttonName: "Add Charges",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenAddCharges()));
              }),
          CustTextButton(
              buttonName: "Add Services",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenAddServices()));
              }),
          CustTextButton(
              buttonName: "Print/Share Invoice",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenPrintInvoice()));
              })
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
