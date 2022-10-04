import "package:flutter/material.dart";
import "package:flutter/src/foundation/key.dart";
import "package:flutter/src/widgets/framework.dart";
import "package:graphql_flutter/graphql_flutter.dart";
import "package:my_rent/constants/color_constants.dart";
import "package:my_rent/gql_client.dart";
import "package:my_rent/main.dart";
import "package:my_rent/register_signin_sections/screen_signin.dart";
import "package:my_rent/register_signin_sections/widgets/country_dropdown.dart";
import "package:my_rent/register_signin_sections/widgets/register_textfield_with_title.dart";
import "package:my_rent/widgets/cust_elevatedbutton.dart";
import "package:my_rent/widgets/cust_subtitle.dart";

// class ScreenRegisterNext extends StatefulWidget {
//   ScreenRegisterNext({
//     Key? key,
//     required this.selectedOptions,
//   }) : super(key: key);
//   List selectedOptions;
//   @override
//   State<ScreenRegisterNext> createState() => _ScreenRegisterNextState();
// }

class ScreenRegisterNext extends StatelessWidget {
  ScreenRegisterNext({
    Key? key,
    required this.selectedOptions,
  }) : super(key: key);

  List selectedOptions;
  TextEditingController businessNameController = TextEditingController();

  TextEditingController contactNumController = TextEditingController();

  TextEditingController businessTypeController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  List dataOfDropdownSec = [];

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(
          onError: (error) => Text("errrr------------" + error.toString()),

          document: gql(
              addBusinessDetails), // this is the mutation string you just created

          onCompleted: (dynamic resultData) {
            print("mutation result -----" + resultData);
          },
        ),
        builder: (
          runMutation,
          result,
        ) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.all(20),
                child: Column(children: [
                  Image.asset("assets/images/myrent_logo1.png"),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustSubTitle(subtitle: "Register", fontsize: 24),
                          ],
                        ),
                        Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              RegisterTextfield(
                                  controller: businessNameController,
                                  title: "Business Name"),
                              // impliment dropdown for country and currency
                              CountrySearchDropdown(ondataChanged: (newId) {
                                dataOfDropdownSec = newId;
                              }),

                              RegisterTextfield(
                                  controller: businessTypeController,
                                  title: "Business Type"),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: addressController,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: "Address",
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.start,
                                  floatingLabelStyle:
                                      const TextStyle(color: customBlue),
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
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
                  const SizedBox(
                    height: 20,
                  ),
                  custElevatedButton(
                      onPressed: () {
                        print(dataOfDropdownSec);
                        runMutation({
                          "address": addressController.text,
                          "business_name": businessNameController.text,
                          "business_type": businessTypeController.text,
                          "allowed_features": selectedOptions.toString(),
                          "phone": dataOfDropdownSec[2].toString() +
                              dataOfDropdownSec[3].toString(),
                          "country_id": dataOfDropdownSec[0],
                        });

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return MyApp();
                        }));
                      },
                      buttonName: Text("Register"))
                ]),
              ),
            ),
          );
        });
  }
}

//add business mutation

String addBusinessDetails =
    r"""mutation ADD_BUSINESS_DETAILS($address: String , $allowed_features: jsonb, $business_name: String, $business_type: String , $country_id: Int, $phone: String) {
  insert_owner_details_one(object: {address: $address, allowed_features: $allowed_features, business_name: $business_name, business_type: $business_type, country_id: $country_id}) {
    uid
  }
  update_users(where: {}, _set: {phone: $phone}){
    affected_rows
  }
}
 """;
