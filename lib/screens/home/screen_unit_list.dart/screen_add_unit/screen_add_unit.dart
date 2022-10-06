import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/constants/color_constants.dart';

import 'package:my_rent/global_variables/global.dart';

import 'package:flutter/material.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/screen_add_unit/widgets/unit_type_dropdown.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddUnit extends StatefulWidget {
  ScreenAddUnit({Key? key, required this.propertyId}) : super(key: key);

  final String propertyId;

  @override
  State<ScreenAddUnit> createState() => _ScreenAddUnitState();
}

class _ScreenAddUnitState extends State<ScreenAddUnit> {
  final unitFormKey = GlobalKey<FormState>();
  String selectedDropDownItem = "";

  TextEditingController bhkController = TextEditingController();
  TextEditingController roomNameController = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController roomNoController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    bhkController.dispose();
    roomNameController.dispose();
    floorNoController.dispose();
    roomNoController.dispose();
    areaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: unitFormKey,
      child: Mutation(
          options: MutationOptions(
            onError: (error) => Text("errrr------------" + error.toString()),

            document:
                gql(addUnit), // this is the mutation string you just created

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
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: CustAppBar2(
                    title: "Add Unit",
                  ),
                ),
                body: Column(
                  children: [
                    //-------Accomodate textfields-------
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      margin: EdgeInsets.all(10),
                      child: ListView(shrinkWrap: true, children: [
                        unitItemDropdown(
                          ondataChanged: (newId) {
                            selectedDropDownItem = newId;
                          },
                        ),
                        GestureDetector(
                          onTap: () => setState(() {}),
                          child: selectedDropDownItem == "Accomodate"
                              ? CustTextFieldContainer(
                                  textFieldName: "BHK",
                                  controller: bhkController,
                                  keyboardType: TextInputType.number,
                                )
                              : CustTextFieldContainer(
                                  textFieldName: "Area",
                                  controller: areaController,
                                  keyboardType: TextInputType.number,
                                ),
                        ),
                        CustTextFieldContainer(
                          textFieldName: "Room Name",
                          controller: roomNameController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return ("Please Enter Room Name");
                          },
                        ),
                        CustTextFieldContainer(
                          textFieldName: "Floor No",
                          controller: floorNoController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value == "")
                              return ("Please Enter Floor No");
                          },
                          onChanged: (value) {
                            unitFormKey.currentState!.validate();
                          },
                        ),
                        CustTextFieldContainer(
                          textFieldName: "Room No",
                          controller: roomNoController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ]),
                    ),
                    //------submit button------
                    RoundedElevatedButton(
                      onPressed: () {
                        
                        if (unitFormKey.currentState!.validate()) {
                          runMutation({
                            'area': selectedDropDownItem != "Accomodate"
                                ? int.tryParse(areaController.text)
                                : 0,
                            'bhk': selectedDropDownItem == "Accomodate"
                                ? int.parse(bhkController.text)
                                : 0,
                            'floor_no': int.tryParse(floorNoController.text),
                            'property_id': widget.propertyId,
                            'room_name': roomNameController.text,
                            'room_no': int.tryParse(roomNoController.text),
                            "type": selectedDropDownItem
                          });
                        }
                      },
                      buttonTitle: "Next",
                      borderRadius: 12,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

//add Unit mutation

String addUnit =
    r"""mutation ADD_PROPERTY_UNIT($area: Int, $bhk: Int, $floor_no: Int, $property_id: uuid, $room_name: String , $room_no: Int, $type: unit_types_enum) {
  insert_property_unit_one(object: {area: $area, bhk: $bhk, floor_no: $floor_no, property_id: $property_id, room_name: $room_name, room_no: $room_no, type: $type}){
    id
  }
}
 """;
