// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:my_rent/constants/color_constants.dart';
// import 'package:my_rent/main.dart';
// import 'package:my_rent/register_signin_sections/screen_signin.dart';
// import 'package:my_rent/register_signin_sections/widgets/country_dropdown.dart';
// import 'package:my_rent/register_signin_sections/widgets/register_textfield_with_title.dart';
// import 'package:my_rent/widgets/cust_elevatedbutton.dart';
// import 'package:my_rent/widgets/cust_subtitle.dart';

// class ScreenRegisterNext extends StatelessWidget {
//   ScreenRegisterNext({
//     Key? key,
//   }) : super(key: key);
//   TextEditingController businessNameController = TextEditingController();

//   TextEditingController contactNumController = TextEditingController();
//   TextEditingController businessTypeController = TextEditingController();
//   TextEditingController addressController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Mutation(
//       options: MutationOptions(onError: (error) => Text(error.toString()),
//         document: gql(
//             addBusinessDetails), // this is the mutation string you just created
//         // you can update the cache based on results
//         // variables: {
//         //   'no_of_rooms': noOfRoomController.text,
//         //   'property_name': propertyNameController.text,
//         //   'address': addressController.text,
//         // },
//         // or do something with the result.data on completion
//         onCompleted: (dynamic resultData) {
//           print(resultData);
//         },
//       ),
//       builder: (
//         runMutation,
//         result,
//       ) {
//         return SafeArea(
//           child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: Container(
//               margin: EdgeInsets.all(20),
//               child: Column(children: [
//                 Image.asset('assets/images/myrent_logo1.png'),
//                 Container(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           CustSubTitle(subtitle: "Register"),
//                         ],
//                       ),
//                       Container(
//                         height: 350,
//                         child: ListView(
//                           shrinkWrap: true,
//                           children: [
//                             RegisterTextfield(
//                                 controller: businessNameController,
//                                 title: "Business Name"),
//                             //impliment dropdown for country and currency
//                             CountrySearchDropdown(),
//                             RegisterTextfield(
//                                 controller: contactNumController,
//                                 title: "Contact No."),
//                             RegisterTextfield(
//                                 controller: businessTypeController,
//                                 title: "Business Type"),
//                             TextField(
//                               controller: addressController,
//                               maxLines: 3,
//                               decoration: InputDecoration(
//                                 labelText: "Address",
//                                 floatingLabelAlignment:
//                                     FloatingLabelAlignment.start,
//                                 floatingLabelStyle:
//                                     TextStyle(color: customBlue),
//                                 alignLabelWithHint: true,
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.grey, width: 2),
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: customBlue, width: 2),
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 custElevatedButton(
//                     onPressed: () {

//                            runMutation({
//                             'address': addressController.text,
//                             'business_name': businessNameController.text,
//                             'business_type': businessTypeController.text,
//                             'country': "dataOfDropdownSec[0]",
//                             "allowed_features": "widget.selectedOptions",
//                             "phone":
//                                 "dataOfDropdownSec[1] + dataOfDropdownSec[2]",
//                             "currency": "dataOfDropdownSec[3]",
//                           });



//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) {
//                         return ScreenSignIn();
//                       }));
//                     },
//                     buttonName: Text("Register"))
//               ]),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // class ScreenRegisterNext extends StatefulWidget {
// //   ScreenRegisterNext({
// //     Key? key,

// //   }) : super(key: key);
// //   //property or vehicles

// //   @override
// //   State<ScreenRegisterNext> createState() => _ScreenRegisterNextState();
// // }

// // class _ScreenRegisterNextState extends State<ScreenRegisterNext> {

// //   TextEditingController businessNameController = TextEditingController();
// //   TextEditingController businessTypeController = TextEditingController();
// //   TextEditingController addressController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Mutation(
// //         options: MutationOptions(
// //           onError: (error) => print(error),
// //           document: gql(addBusinessDetails),
// //           // onCompleted: (dynamic resultData) {
// //           //   Navigator.push(
// //           //       context, MaterialPageRoute(builder: (context) => MyApp()));
// //           // }
// //         ),
// //         builder: (runMutation, result) {
// //           return SafeArea(
// //             child: Scaffold(
// //               resizeToAvoidBottomInset: false,
// //               body: Container(
// //                 margin: EdgeInsets.all(20),
// //                 child: Form(
// //                   child: Column(children: [
// //                     Image.asset('assets/images/myrent_logo1.png'),
// //                     Container(
// //                       child: Column(
// //                         children: [
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.start,
// //                             children: [
// //                               CustSubTitle(subtitle: "Register"),
// //                             ],
// //                           ),
// //                           Container(
// //                             child: ListView(
// //                               shrinkWrap: true,
// //                               children: [
// //                                 RegisterTextfield(
// //                                   controller: businessNameController,
// //                                   title: "Business Name",
// //                                   validator: (value) {
// //                                     if (value!.isEmpty) {
// //                                       return ("Enter Your Name");
// //                                     }
// //                                   },
// //                                   onChanged: (value) {
// //                                     // _regFormKey.currentState!.validate();
// //                                   },
// //                                 ),
// //                                 //impliment dropdown for country and currency

// //                                 RegisterTextfield(
// //                                   controller: businessTypeController,
// //                                   title: "Business Type",
// //                                   validator: (value) {
// //                                     if (value!.isEmpty) {
// //                                       return ("Enter Business Type");
// //                                     }
// //                                   },
// //                                   onChanged: (value) {
// //                                     // _regFormKey.currentState!.validate();
// //                                   },
// //                                 ),
// //                                 TextFormField(
// //                                   controller: addressController,
// //                                   maxLines: 3,
// //                                   decoration: InputDecoration(
// //                                     labelText: "Address",
// //                                     floatingLabelAlignment:
// //                                         FloatingLabelAlignment.start,
// //                                     floatingLabelStyle:
// //                                         TextStyle(color: customBlue),
// //                                     alignLabelWithHint: true,
// //                                     enabledBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(
// //                                           color: Colors.grey, width: 2),
// //                                       borderRadius: BorderRadius.circular(8.0),
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(
// //                                           color: customBlue, width: 2),
// //                                       borderRadius: BorderRadius.circular(8.0),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       height: 20,
// //                     ),
// //                     custElevatedButton(
// //                         onPressed: () {

// //                           // runMutation({
// //                           //   'address': addressController.text,
// //                           //   'business_name': businessNameController.text,
// //                           //   'business_type': businessTypeController.text,
// //                           //   'country': dataOfDropdownSec[0],
// //                           //   "allowed_features": widget.selectedOptions,
// //                           //   "phone":
// //                           //       dataOfDropdownSec[1] + dataOfDropdownSec[2],
// //                           //   "currency": dataOfDropdownSec[3],
// //                           // });
// //                         },
// //                         buttonName: Text("Register"))
// //                   ]),
// //                 ),
// //               ),
// //             ),
// //           );
// //         });
// //   }
// // }

// //add business mutation

// String addBusinessDetails =
//     """mutation ADD_BUSINESS_DETAILS(\$phone: String, \$address: String , \$allowed_features: jsonb , \$business_name: String, \$business_type: String, \$country: String, \$currency: String) {
//   insert_users_one(object: {phone: \$phone, owner_detail: {data: {address: \$address, allowed_features: \$allowed_features, business_name: \$business_name, business_type: \$business_type, country: \$country, currency: \$currency}}}){
//     uid
//     updated_at
// }
//  """;
