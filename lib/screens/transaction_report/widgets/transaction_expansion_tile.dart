import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';

class TransactionExpansionTile extends StatelessWidget {
  const TransactionExpansionTile({
    Key? key,
  }) : super(key: key);

  static const expSubTitleStyle = TextStyle(
    fontSize: 13,
    color: Color.fromARGB(255, 95, 95, 95),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ExpansionTile(
          iconColor: Colors.black26,
          leading: CircleAvatar(
              radius: 30,
              backgroundColor: bottomNavYellow,
              child: Icon(
                Icons.currency_rupee,
                color: Colors.white,
              )),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Name :',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color.fromARGB(255, 95, 95, 95),
              ),
            ),
          ),
          subtitle: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Row(
                    children: [
                      Text(
                        "02/05/2022",
                        style: expSubTitleStyle,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "01:30 PM",
                        style: expSubTitleStyle,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "₹ ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color.fromARGB(255, 95, 95, 95),
                          ),
                        ),
                        Text(
                          "4000",
                          style: expSubTitleStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Text(
                            "By : ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color.fromARGB(255, 95, 95, 95),
                            ),
                          ),
                          Text(
                            "cash",
                            style: expSubTitleStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Collected By :",
                            style: expSubTitleStyle,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Remark         :", style: expSubTitleStyle),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                custElevatedButton(
                  onPressed: () {},
                  buttonName: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.whatsapp_outlined,
                        size: 16,
                      ),
                      Text(
                        " Send invoice",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  buttonHeight: 35,
                  buttonWidth: 125,
                  buttonBorderRadius: 10,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
