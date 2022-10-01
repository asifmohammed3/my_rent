import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/register_signin_sections/screen_register_next.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/splash_screen/select_prop_or_veh/selectable_widgets.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

class ScreenPropVehSelection extends StatefulWidget {
  const ScreenPropVehSelection({Key? key}) : super(key: key);

  @override
  State<ScreenPropVehSelection> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<ScreenPropVehSelection> {
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 5.0, bottom: 40),
        child: FloatingActionButton(
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          backgroundColor: customBlue,
          onPressed: (() {
            if (vehicleSelected == false && propertySelected == false) {
              unSelectedPopUp(context).then((val) {
                if (_timer.isActive) {
                  _timer.cancel();
                }
              });
            } else {
              List selectedItems = [];

              if (propertySelected && vehicleSelected) {
                selectedItems.add("property");
                selectedItems.add("vehicle");
              } else if (propertySelected) {
                selectedItems.add("property");
              } else if (propertySelected) {
                selectedItems.add("vehicle");
              }
              print(selectedItems);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return ScreenRegisterNext(
                  selectedOptions: selectedItems,
                );
              }));
            }
          }),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            // color: Colors.red,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: -50,
                  bottom: 70,
                  child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: bottomNavYellow,
                            borderRadius: BorderRadius.circular(12)),
                        height: 350,
                        width: 300,
                      )),
                ),
                Positioned(
                  left: -80,
                  bottom: 100,
                  child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: customBlue,
                            borderRadius: BorderRadius.circular(12)),
                        height: 300,
                        width: 250,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 40),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset("assets/images/myrent_logo1.png")),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 18),
                      child: CustSubTitle(subtitle: "Select your options"),
                    )),
              ],
            ),
          ),
          SelectableWidget()
        ],
      ),
    );
  }

  Future<dynamic> unSelectedPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          _timer = Timer(Duration(seconds: 1), () {
            Navigator.of(context).pop();
          });

          return const AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18.0))),
            title: Center(
                child: Text(
              ' Please select \natleast one option',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: pieChartEmptyColor2, fontWeight: FontWeight.w400),
            )),
            content: SingleChildScrollView(
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Color.fromARGB(255, 247, 159, 159),
                child: Icon(
                  Icons.close,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
