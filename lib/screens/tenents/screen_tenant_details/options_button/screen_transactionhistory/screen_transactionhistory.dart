import 'package:flutter/material.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/screen_transactionhistory/widgets/transaction_list_tile.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';

class ScreenTransactionHistory extends StatelessWidget {
  const ScreenTransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: "Transaction History",
          ),
        ),
        body: TransactionListTile(),
      ),
    );
  }
}
