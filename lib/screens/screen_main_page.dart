import 'package:flutter/material.dart';
import 'package:my_rent/screens/complaints/screen_complaint.dart';
import 'package:my_rent/screens/home/screen_home.dart';
import 'package:my_rent/screens/property_overview/screen_property_overview.dart';
import 'package:my_rent/screens/tenents/screen_tenents.dart';
import 'package:my_rent/screens/transaction_report/screen_transaction_report.dart';
import 'package:my_rent/widgets/bottom_nav_widget.dart';
import 'package:my_rent/widgets/drawer_section.dart/cust_drawer.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    ScreenTenents(),
    ScreenPropertyOverview(),
    ScreenComplaint(),
    ScreenTransactionReport()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustDrawer(),
        extendBody: true,
        body: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int newIndex, _) {
              return _pages[newIndex];
            }),
        bottomNavigationBar: const BottomNavigationWidget(),
      ),
    );
  }
}
