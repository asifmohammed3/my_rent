import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

Container drawerHeaderSection() {
  return Container(
    decoration: const BoxDecoration(
      color: bottomNavYellow,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(18),
        bottomRight: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
    ),
    height: 110,
    width: double.infinity,
    child: Container(
      // color: Colors.red,
      margin: EdgeInsets.all(10),
      height: 40,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 48,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg")),
            ),
            Expanded(
              child: Container(
                height: 70,
                // width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 13),
                          ),
                          Text(
                            "Phone",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: IconButton(
                            onPressed: () {
                              print("edit profile clicked");
                            },
                            icon: Icon(
                              Icons.edit_note,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
    ),
  );
}
