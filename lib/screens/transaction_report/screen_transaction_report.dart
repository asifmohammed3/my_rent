import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/widgets/linear_progressbar.dart';
import 'package:my_rent/screens/transaction_report/widgets/transaction_expansion_tile.dart';
import 'package:my_rent/screens/transaction_report/widgets/transacton_header_tile.dart';
import 'package:my_rent/widgets/cust_appbar.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/drawer_section.dart/cust_drawer.dart';
import 'package:my_rent/widgets/pie_chart.dart';

class ScreenTransactionReport extends StatefulWidget {
  const ScreenTransactionReport({Key? key}) : super(key: key);

  @override
  State<ScreenTransactionReport> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenTransactionReport> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static const whiteTextStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldWhite,
      key: _scaffoldKey,
      drawer: CustDrawer(),
      appBar: CustAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Transaction Report',
      ),
      extendBody: true,
      body: Container(
          margin: EdgeInsets.only(left: 14, right: 14),
          child: Column(
            children: [
              TransactionHeaderTile(whiteTextStyle: whiteTextStyle),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    TransactionExpansionTile(),
                    TransactionExpansionTile(),
                    TransactionExpansionTile(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
