import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

import 'package:my_rent/global_variables/global.dart';

import 'package:flutter/material.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddUnit extends StatefulWidget {
  ScreenAddUnit({Key? key}) : super(key: key);

  @override
  State<ScreenAddUnit> createState() => _ScreenAddUnitState();
}

class _ScreenAddUnitState extends State<ScreenAddUnit> {
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
            title: "Add Unit",
          ),
        ),
        body: ValueListenableBuilder(
            valueListenable: addUnitTypeNotifier,
            builder: (context, index, _) {
              if (index == 0) {
                return Column(
                  children: [
                    //-------Accomodate textfields-------
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      margin: EdgeInsets.all(10),
                      child: ListView(children: [
                        AddUnitTypeDropDown(),
                        CustTextFieldContainer(
                          textFieldName: "BHK",
                          controller: unitNumberController,
                        ),
                        CustTextFieldContainer(
                          textFieldName: "Room Name",
                          controller: unitNumberController,
                        ),
                        CustTextFieldContainer(
                            textFieldName: "Floor No",
                            controller: serviceTypeController),
                        CustTextFieldContainer(
                            textFieldName: "Room No",
                            controller: serviceFeeController),
                      ]),
                    ),
                    //------submit button------
                    RoundedElevatedButton(
                      onPressed: () {},
                      buttonTitle: "Next",
                      borderRadius: 12,
                    )
                  ],
                );
              } else if (index == 1) {
                return Column(
                  children: [
                    //-------complaints textfields-------
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      margin: EdgeInsets.all(10),
                      child: ListView(children: [
                        AddUnitTypeDropDown(),
                        CustTextFieldContainer(
                          textFieldName: "Area",
                          controller: unitNumberController,
                        ),
                        CustTextFieldContainer(
                            textFieldName: "Room Name",
                            controller: serviceTypeController),
                        CustTextFieldContainer(
                            textFieldName: "Floor No",
                            controller: serviceFeeController),
                        CustTextFieldContainer(
                            textFieldName: "Room No",
                            controller: serviceFeeController),
                      ]),
                    ),
                    //------submit button------
                    RoundedElevatedButton(
                      onPressed: () {},
                      buttonTitle: "Next",
                      borderRadius: 12,
                    )
                  ],
                );
              } else if (index == 2) {
                return Column(
                  children: [
                    //-------complaints textfields-------
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      margin: EdgeInsets.all(10),
                      child: ListView(children: [
                        AddUnitTypeDropDown(),
                        CustTextFieldContainer(
                          textFieldName: "Area",
                          controller: unitNumberController,
                        ),
                        CustTextFieldContainer(
                            textFieldName: "Room Name",
                            controller: serviceTypeController),
                        CustTextFieldContainer(
                            textFieldName: "Floor No",
                            controller: serviceFeeController),
                        CustTextFieldContainer(
                            textFieldName: "Room No",
                            controller: serviceFeeController),
                      ]),
                    ),
                    //------submit button------
                    RoundedElevatedButton(
                      onPressed: () {},
                      buttonTitle: "Next",
                      borderRadius: 12,
                    )
                  ],
                );
              }
              return Text("Errrrrrrrrrr");
            }),
      ),
    );
  }
}

ValueNotifier<int> addUnitTypeNotifier = ValueNotifier<int>(0);

class AddUnitTypeDropDown extends StatefulWidget {
  AddUnitTypeDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<AddUnitTypeDropDown> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<AddUnitTypeDropDown> {
  // Initial Selected Value
  String dropdownvalue = 'Accomodate';

  // List of items in our dropdown menu
  var items = [
    'Accomodate',
    'Showroom',
    'Store',
  ];

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;
    var kHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: kWidth,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: 100,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    "Type",
                    style: TextStyle(fontSize: 13, color: customBlue),
                  ),
                ),
                Text(":")
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            margin: EdgeInsets.all(10),
            child: SizedBox(
              width: 120,
              child: Container(
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  underline: SizedBox(), elevation: 50,
                  // dropdownColor: Color.fromARGB(240, 14, 76, 149),

                  borderRadius: BorderRadius.circular(15),

                  // Down Arrow Icon
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    // color: Colors.white,
                  ),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      enabled: true,
                      child: Text(
                        items,
                        // style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      addUnitTypeNotifier.value = items.indexOf(dropdownvalue);

                      //refresh app to change vehicle part and prop
                    });
                  },
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
