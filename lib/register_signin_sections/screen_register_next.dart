import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/main.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/register_signin_sections/widgets/register_textfield_with_title.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

class ScreenRegisterNext extends StatefulWidget {
  ScreenRegisterNext({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenRegisterNext> createState() => _ScreenRegisterNextState();
}

class _ScreenRegisterNextState extends State<ScreenRegisterNext> {
  final _regFormKey = GlobalKey<FormState>();
  TextEditingController businessNameController = TextEditingController();

  TextEditingController contactNumController = TextEditingController();

  TextEditingController businessTypeController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(
            document: gql(addBusinessDetails),
            onCompleted: (dynamic resultData) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            }),
        builder: (runMutation, result) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.all(20),
                child: Form(
                  key: _regFormKey,
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
                                  title: "Business Name",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Enter Your Name");
                                    }
                                  },
                                  onChanged: (value) {
                                    _regFormKey.currentState!.validate();
                                  },
                                ),
                                //impliment dropdown for country and currency
          
                                RegisterTextfield(
                                  controller: contactNumController,
                                  title: "Contact No.",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Enter Contact Number");
                                    }
                                  },
                                  onChanged: (value) {
                                    _regFormKey.currentState!.validate();
                                  },
                                ),
                                RegisterTextfield(
                                  controller: businessTypeController,
                                  title: "Business Type",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Enter Business Type");
                                    }
                                  },
                                  onChanged: (value) {
                                    _regFormKey.currentState!.validate();
                                  },
                                ),
                                TextFormField(
                                  controller: addressController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    labelText: "Address",
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    floatingLabelStyle:
                                        TextStyle(color: customBlue),
                                    alignLabelWithHint: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: customBlue, width: 2),
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
                          Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return MyApp();
                })));
                        //  if(_regFormKey.currentState!.validate()) {
                          // runMutation({
                          //     'address': addressController.text,
                          //     'business_name': businessNameController.text,
                          //     'business_type': businessTypeController.text,
                          //     'country': ,
                          //     'currency': ,
                          //   });
                        //  }
                           
                        },
                        buttonName: Text("Register"))
                  ]),
                ),
              ),
            ),
          );
        });
  }
}

const String addBusinessDetails = """
  mutation Add_BUSINESS_DETAILS(\$address: String , \$business_name: String , \$business_type: String , \$country: String , \$currency: String ) {
  insert_owner_details_one(object: {address: \$address, business_name: \$business_name, business_type: \$business_type, country: \$country, currency: \$currency}) {
    uid
  }
}
""";
