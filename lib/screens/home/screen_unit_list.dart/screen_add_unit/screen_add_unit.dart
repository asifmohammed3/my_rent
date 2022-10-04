import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

import 'package:my_rent/global_variables/global.dart';

import 'package:flutter/material.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/screen_add_unit/widgets/unit_type_dropdown.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddUnit extends StatefulWidget {
  ScreenAddUnit({Key? key}) : super(key: key);

  @override
  State<ScreenAddUnit> createState() => _ScreenAddUnitState();
}

class _ScreenAddUnitState extends State<ScreenAddUnit> {

String selectedDropDownItem="";


  //controllers for ACCOMODATE type
  TextEditingController accomodateBhkController = TextEditingController();
  TextEditingController accomodateRoomNameController = TextEditingController();
  TextEditingController accomodateFloorNoController = TextEditingController();
  TextEditingController accomodateRoomNoController = TextEditingController();

  //controllers for SHOWROOM type
  TextEditingController showroomAreaController = TextEditingController();
  TextEditingController showroomRoomNameController = TextEditingController();
  TextEditingController showroomFloorNoController = TextEditingController();
  TextEditingController showroomRoomNoController = TextEditingController();

//controllers for STORE type
  TextEditingController storeAreaController = TextEditingController();
  TextEditingController storeRoomNameController = TextEditingController();
  TextEditingController storeFloorNoController = TextEditingController();
  TextEditingController storeRoomNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      child: ListView(children: [
                        unitItemDropdown(ondataChanged: (newId) {
                                selectedDropDownItem = newId;
                              },),
                        CustTextFieldContainer(
                          textFieldName: "BHK",
                          controller: accomodateBhkController,
                        ),
                        CustTextFieldContainer(
                          textFieldName: "Room Name",
                          controller: accomodateRoomNameController,
                        ),
                        CustTextFieldContainer(
                            textFieldName: "Floor No",
                            controller: accomodateFloorNoController),
                        CustTextFieldContainer(
                            textFieldName: "Room No",
                            controller: accomodateRoomNoController),
                      ]),
                    ),
                    //------submit button------
                    RoundedElevatedButton(
                      onPressed: () {},
                      buttonTitle: "Next",
                      borderRadius: 12,
                    )
                  ],
                ),
      ),
    );
  }
}
