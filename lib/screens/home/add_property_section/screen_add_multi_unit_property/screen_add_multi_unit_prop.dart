import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/cust_textbutton.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddMultiUnitProperty extends StatelessWidget {
  ScreenAddMultiUnitProperty({Key? key}) : super(key: key);

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController noOfRoomController = TextEditingController();
    TextEditingController addressController = TextEditingController();

//TODO upload img  (not a text field)

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(ADD_PROPERTY), // this is the mutation string you just created
        // you can update the cache based on results
        variables: {                              'no_of_rooms': noOfRoomController.text,
                              'property_name': propertyNameController.text,
                              'address': addressController.text,},
        // or do something with the result.data on completion
        onCompleted: (dynamic resultData) {
          print(resultData);
        },
      ),
      builder: (
        runMutation,
        result,
      ) {
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
                        textFieldName: "Address",
                        controller: addressController),
                  ]),
                ),
                //------Add button------
                RoundedElevatedButton(
                  onPressed: () {
                     runMutation({
                              
                            });

                  },
                  buttonTitle: "Add",
                  buttonColor: bottomNavYellow,
                  borderRadius: 12,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

String ADD_PROPERTY = """mutation ADD_PROPERTY(\$no_of_rooms: Int , \$property_name: String , \$address : String ) {
  insert_property_owner_one(object: {property: {data: {no_of_rooms: \$no_of_rooms, property_name: \$property_name, address : \$address}}}) {
    property {
      id
      created_at
    }
  }
}

""";
