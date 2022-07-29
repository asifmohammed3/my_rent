import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

class SelectableWidget extends StatefulWidget {
  SelectableWidget({Key? key}) : super(key: key);

  @override
  State<SelectableWidget> createState() => _SelectableWidgetState();
}

class _SelectableWidgetState extends State<SelectableWidget> {
  Decoration _unSelecteddecoration = BoxDecoration(
    border: Border.all(color: Colors.black, width: 0.5),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  Decoration _selectedDecoration = BoxDecoration(
    border: Border.all(color: customBlue, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  // bool propertySelected = false;
  // bool vehicleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  child: Container(
                    height: 130,
                    decoration: propertySelected
                        ? _selectedDecoration
                        : _unSelecteddecoration,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: SvgPicture.asset(
                              "assets/svg_images/onboarding/select_property.svg"),
                        ),
                        CustSubTitle(
                          paddingTop: 0,
                          subtitle: "Property   ",
                          fontWeight: FontWeight.w400,
                          fontsize: 20,
                        ),
                      ],
                    ),
                  ),
                  //ontap container
                  onTap: () {
                    propertySelected = !propertySelected;
                    print("property :${propertySelected}");
                    setState(() {});
                  },
                ),
                propertySelected
                    ? Positioned(
                        top: -16, right: -16, child: GreenCheck(context))
                    : SizedBox()
              ],
            ),
          ),
        ),

        //---------vehicle select----------
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  child: Container(
                    height: 130,
                    decoration: vehicleSelected
                        ? _selectedDecoration
                        : _unSelecteddecoration,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustSubTitle(
                          paddingTop: 0,
                          subtitle: "Vehicle",
                          fontWeight: FontWeight.w400,
                          fontsize: 20,
                        ),
                        Container(
                          child: SvgPicture.asset(
                              "assets/svg_images/onboarding/select_vehicle.svg"),
                        ),
                      ],
                    ),
                  ),
                  //ontap container
                  onTap: () {
                    vehicleSelected = !vehicleSelected;
                    print("vehicle :${vehicleSelected}");
                    setState(() {});
                  },
                ),
                vehicleSelected
                    ? Positioned(
                        top: -16, right: -16, child: GreenCheck(context))
                    : SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget GreenCheck(BuildContext context) {
  return CircleAvatar(
    radius: 25,
    child: Icon(
      Icons.check,
      color: Colors.white,
    ),
    backgroundColor: Color.fromARGB(255, 166, 202, 131),
  );
}
