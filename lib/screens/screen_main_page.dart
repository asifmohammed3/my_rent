import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/screens/complaints/screen_complaint.dart';
import 'package:my_rent/screens/home/screen_home.dart';
import 'package:my_rent/screens/property_overview/screen_property_overview_main.dart';
import 'package:my_rent/screens/tenents/screen_tenents.dart';
import 'package:my_rent/screens/transaction_report/screen_transaction_report.dart';
import 'package:my_rent/widgets/bottom_nav_widget.dart';
import 'package:my_rent/widgets/drawer_section/cust_drawer.dart';
import 'package:my_rent/widgets/widget_test.dart';

class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        drawer: CustDrawer(),
        body: ScreenMain(),
      ),
    );
  }
}

class ScreenMain extends StatelessWidget {
  ScreenMain({Key? key}) : super(key: key);

  final _pages = [
    //WidgetTest(),
    ScreenHome(),
    ScreenTenents(),
    ScreenPropertyOverviewMain(),
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
