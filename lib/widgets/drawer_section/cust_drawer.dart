import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/constants/styles.dart';
import 'package:my_rent/main.dart';
import 'package:my_rent/register_signin_sections/authentication/authentication.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/screens/home/screen_home.dart';
import 'package:my_rent/screens/screen_cash_flow/screen_cash_flow.dart';
import 'package:my_rent/screens/screen_main_page.dart';
import 'package:my_rent/screens/screen_staff_list/screen_staff_list.dart';
import 'package:my_rent/widgets/drawer_section/components/drawer_header_section.dart';

class CustDrawer extends StatefulWidget {
  const CustDrawer({Key? key}) : super(key: key);

  @override
  State<CustDrawer> createState() => _CustDrawerState();
}

class _CustDrawerState extends State<CustDrawer> {
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
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            drawerHeaderSection(),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  DrawerTile(
                      tileName: "Home",
                      icon: Icons.home,
                      onTap: () {
                        Navigator.pop(context);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ScreenMainPage();
                        }));
                      }),
                  ExpandedDrawerTile(),
                  DrawerTile(
                      tileName: "Cash Flow",
                      icon: Icons.payment,
                      onTap: () {
                        Navigator.pop(context);

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return ScreenCashFlow();
                        }));
                      }),
                  DrawerTile(
                      tileName: "Help & Support",
                      icon: Icons.help,
                      onTap: () {
                        Navigator.pop(context);

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return ScreenCashFlow();
                        }));
                      }),
                  DrawerTile(
                      tileName: "Log Out",
                      icon: Icons.logout,
                      onTap: () async {
                        Navigator.pop(context);
                        
                          await signOut();
                      setState(() {  });
                        
                      }),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  DrawerTile(
      {super.key,
      required this.icon,
      required this.tileName,
      required this.onTap});

  String tileName;
  IconData icon;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tileName, style: subTitleStyle),
      leading: Icon(
        icon,
        size: 22,
      ),
      onTap: onTap,
    );
  }
}

class ExpandedDrawerTile extends StatelessWidget {
  const ExpandedDrawerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("User Management", style: subTitleStyle),
      leading: Icon(
        Icons.people_sharp,
        color: Colors.grey,
        size: 22,
      ), //add icon
      childrenPadding: EdgeInsets.only(left: 60), //children padding
      children: [
        ListTile(
          title: Text("Add Staff", style: subTitleStyle),
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ScreenStaffList()),
            );
          },
        ),
      ],
    );
  }
}
