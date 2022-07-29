import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/widgets/drawer_section.dart/components/drawer_header_section.dart';

class CustDrawer extends StatelessWidget {
  const CustDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        width: 250,
        child: Column(children: [
          drawerHeaderSection(),
          
        ]),
      ),
    );
  }

  
}
