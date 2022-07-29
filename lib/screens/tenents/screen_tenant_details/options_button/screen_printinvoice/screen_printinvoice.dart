import 'package:flutter/material.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';

class ScreenPrintInvoice extends StatelessWidget {
  const ScreenPrintInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: "Invoice",
          
          ),
        ),
      ),
    );
  }
}
