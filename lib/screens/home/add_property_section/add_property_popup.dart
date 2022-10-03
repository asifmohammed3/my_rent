import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/add_property_section/screen_add_multi_unit_property/screen_add_multi_unit_prop.dart';
import 'package:my_rent/screens/home/add_property_section/screen_add_single_unit_property/screen_add_single_unit_prop.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

showAddropertyPopup(BuildContext context) {
  const subTitleStyle = TextStyle(
    fontSize: 13,
    color: Color.fromARGB(255, 95, 95, 95),
  );
  // set up the AlertDialog
  AlertDialog addPropertyOptions = AlertDialog(
    contentPadding: EdgeInsets.all(7),
    title: CustSubTitle(
        subtitle: "What type of Property you would like to add?",
        paddingTop: 0),
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return ScreenAddSingleUnitProperty();
                })));
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: scaffoldWhite,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/single_unit_property_pic.svg',
                    ),
                    Text("Single Unit Property", style: subTitleStyle),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) {
                  return ScreenAddMultiUnitProperty();
                })));
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: scaffoldWhite,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/multi_unit_property_pic.svg',
                    ),
                    Text("Multiple Unit Property", style: subTitleStyle),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return addPropertyOptions;
    },
  );
}
