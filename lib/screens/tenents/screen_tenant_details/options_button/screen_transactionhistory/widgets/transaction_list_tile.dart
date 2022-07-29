
// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(color: Color.fromARGB(100, 229, 229, 252)),
        margin: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10),
            child: const SizedBox(
              height: 40,
              child:  Text(
                "17/05/2022",
                style: const TextStyle(
                    color: customBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text(
                    "Rent",
                    style: TextStyle(
                        color: Color.fromARGB(255, 69, 69, 69),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Text("Credited: ₹1000"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Service Fee",
                    style: TextStyle(
                        color: Color.fromARGB(255, 69, 69, 69),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Text("Credited: ₹500"),
                  Text("Credited: ₹1500"),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(Icons.whatsapp),
                    SizedBox(
                      width: 3,
                    ),
                    Text("Share")
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
