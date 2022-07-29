import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/screen_home.dart';

//Appbar for main pages
class CustAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(120);

  const CustAppBar(
      {Key? key,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required this.title})
      : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: TextStyle(color: customBlue),
        ),
        leading: IconButton(
          onPressed: () {
            // _scaffoldKey.currentState!.openDrawer();
            RootScaffold.openDrawer(context);
          },
          icon: Icon(Icons.menu),
          color: customBlue,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

//helps to open the drawer from root (ie,over bottom nav bar)
class RootScaffold {
  static openDrawer(BuildContext context) {
    final ScaffoldState? scaffoldState =
        context.findRootAncestorStateOfType<ScaffoldState>();
    scaffoldState?.openDrawer();
  }
}
