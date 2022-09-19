import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/property_overview/property_overview.dart/widgets/accounts_cards.dart';
import 'package:my_rent/widgets/bottom_nav_widget.dart';
import 'package:my_rent/widgets/cust_appbar.dart';
import 'package:my_rent/widgets/drawer_section/cust_drawer.dart';

class ScreenCashFlow extends StatefulWidget {
  const ScreenCashFlow({Key? key}) : super(key: key);

  @override
  State<ScreenCashFlow> createState() => _ScreenCashFlowsState();
}

class _ScreenCashFlowsState extends State<ScreenCashFlow> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: scaffoldWhite,
          key: _scaffoldKey,
          drawer: CustDrawer(),
          bottomNavigationBar: BottomNavigationWidget(),
          appBar: CustAppBar(
            scaffoldKey: _scaffoldKey,
            title: 'Cashflow',
          ),
          extendBody: true,
          body: Container(
              margin: EdgeInsets.only(right: 15, left: 15),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: Row(
                      children: [
                        AccountCards(
                            boxColor: Color.fromARGB(87, 107, 214, 0),
                            textColor: Colors.white,
                            title: "Total Collection",
                            collectionAmount: "20000"),
                        SizedBox(
                          width: 12,
                        ),
                        AccountCards(
                            boxColor: Color.fromARGB(100, 255, 16, 0),
                            textColor: Colors.white,
                            title: "Total Expense",
                            collectionAmount: "20000"),
                      ],
                    ),
                  ),
                  Table(
                      border: TableBorder
                          .all(), // Allows to add a border decoration around your table
                      children: [
                        TableRow(children: [
                          Text('Unit Name & No.'),
                          Text('Collected Amount'),
                          Text('Expense Amount'),
                          Text('Total Balance'),
                        ]),
                        TableRow(children: [
                          Text(
                            'Property 1\n10',
                          ),
                          Text('Rs. 5000'),
                          Text('Rs. 2500'),
                          Text('Rs. 2500'),
                        ]),
                        TableRow(children: [
                          Text(
                            'Property 1\n10',
                          ),
                          Text('Rs. 5000'),
                          Text('Rs. 2500'),
                          Text('Rs. 2500'),
                        ]),
                      ]),
                ],
              ))),
    );
  }
}
