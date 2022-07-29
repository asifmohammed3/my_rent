import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/register_signin_sections/widgets/register_textfield_with_title.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

class ScreenRegisterNext extends StatelessWidget {
  ScreenRegisterNext({
    Key? key,
  }) : super(key: key);
  TextEditingController businessNameController = TextEditingController();

  TextEditingController contactNumController = TextEditingController();
  TextEditingController businessTypeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(children: [
          Image.asset('assets/images/myrent_logo1.png'),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustSubTitle(subtitle: "Register"),
                  ],
                ),
                Container(
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RegisterTextfield(
                          controller: businessNameController,
                          title: "Business Name"),
                      //impliment dropdown for country and currency

                      RegisterTextfield(
                          controller: contactNumController,
                          title: "Contact No."),
                      RegisterTextfield(
                          controller: businessTypeController,
                          title: "Business Type"),
                      TextField(
                        controller: addressController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: "Address",
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          floatingLabelStyle: TextStyle(color: customBlue),
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: customBlue, width: 2),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          custElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return ScreenSignIn();
                }));
              },
              buttonName: Text("Register"))
        ]),
      ),
    );
  }
}
