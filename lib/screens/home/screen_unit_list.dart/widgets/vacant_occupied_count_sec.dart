import 'package:flutter/material.dart';

Padding vacantOccupiedCountSec(String vacantCount, String occupiedCount) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 216, 0, 0),
                radius: 6,
              ),
              SizedBox(width: 4),
              Text(
                "Vacant (${vacantCount})",
                style: TextStyle(
                  color: Color.fromARGB(255, 216, 0, 0),
                ),
              )
            ]),
          ),
          SizedBox(width: 35),
          Container(
            child: Row(
              children: [
                Container(
                  child: Row(children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 128, 182, 74),
                      radius: 6,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Occupied (${occupiedCount})",
                      style: TextStyle(
                        color: Color.fromARGB(255, 128, 182, 74),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
