import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/widgets/linear_progressbar.dart';

class TransactionHeaderTile extends StatelessWidget {
  const TransactionHeaderTile({
    Key? key,
    required this.whiteTextStyle,
  }) : super(key: key);

  final TextStyle whiteTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 14, 76, 149),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Rent",
                style: whiteTextStyle,
              ),
              Container(
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "January",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          LinearProgressBar(value: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Collected",
                      style: TextStyle(color: bottomNavYellow, fontSize: 10),
                    ),
                    Text(
                      "Rs. 20,000",
                      style: TextStyle(color: bottomNavYellow, fontSize: 15),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pending",
                      style: TextStyle(color: bottomNavYellow, fontSize: 10),
                    ),
                    Text(
                      "Rs. 20,000",
                      style: TextStyle(color: bottomNavYellow, fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
