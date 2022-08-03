import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/property_overview/property_overview.dart/widgets/accounts_cards.dart';
import 'package:my_rent/screens/property_overview/property_overview.dart/widgets/expense_data_table_widget.dart';
import 'package:my_rent/screens/property_overview/property_overview.dart/widgets/expense_pie_chart_section.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';
import 'package:my_rent/widgets/cust_textbutton.dart';
import 'package:my_rent/widgets/linear_progressbar.dart';

class ScreenPropertyOverview extends StatelessWidget {
  const ScreenPropertyOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldWhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustSubTitle(
            paddingTop: 0,
            subtitle: "Overview",
            color: customBlue,
            fontWeight: FontWeight.w500,
            fontsize: 30,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 10),
              child: TextButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: customBlue, fontSize: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Account section
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustSubTitle(
                      subtitle: "Accounts",
                      fontWeight: FontWeight.w500,
                      fontsize: 22,
                      paddingTop: 0),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      AccountCards(
                          boxColor: customBlue,
                          textColor: Colors.white,
                          title: "Total Collection",
                          collectionAmount: "10000"),
                      SizedBox(
                        width: 12,
                      ),
                      AccountCards(
                          boxColor: bottomNavYellow,
                          textColor: customBlue,
                          title: "Pending Collection",
                          collectionAmount: "1000"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                //expense section
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustSubTitle(
                      subtitle: "Expenses",
                      fontWeight: FontWeight.w500,
                      fontsize: 22,
                      paddingTop: 0),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        // color: Colors.amberAccent,
                        height: 170,
                        width: 170,
                        child: ExpensePieChart(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.all(6),
                          height: 150,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              expenseDataTable(
                                  Color.fromARGB(255, 91, 155, 213),
                                  "Water",
                                  "1000"),
                              expenseDataTable(Color.fromARGB(255, 67, 104, 43),
                                  "Internet", "1000"),
                              expenseDataTable(
                                  Color.fromARGB(255, 112, 173, 71),
                                  "Electricity",
                                  "500"),
                              expenseDataTable(Color.fromARGB(255, 255, 192, 0),
                                  "Services", "250"),
                            ],
                          )),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color.fromARGB(255, 231, 231, 231)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Total Expenses"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "₹ 2750",
                              style: TextStyle(color: customBlue, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                //Occupancy section
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustSubTitle(
                      subtitle: "Occupancy",
                      fontWeight: FontWeight.w500,
                      fontsize: 22,
                      paddingTop: 0),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color.fromARGB(255, 231, 231, 231)),
                  child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: LinearProgressBar(
                          value: 0.5,
                          color: Color.fromARGB(255, 91, 155, 213),
                          width: 20,
                          showLabel: true,
                        ),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
