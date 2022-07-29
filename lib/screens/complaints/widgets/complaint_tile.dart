import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

class ComplaintTile extends StatelessWidget {
  ComplaintTile(
      {Key? key,
      required this.category,
      required this.date,
      required this.status,
      required this.description,
      required this.imageSrc})
      : super(key: key);

  String category;
  String date;
  String status;
  String description;
  String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // color: Colors.red,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                  )
                ],
                color: Color.fromARGB(255, 250, 250, 250),
                borderRadius: BorderRadius.all(
                  Radius.circular(18.0),
                ),
              ),
            ),
          ),

          //text section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      // color: Colors.blue,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Category",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Date"),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Status"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            category,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Color.fromARGB(
                                                  170, 95, 95, 95),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            date,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Color.fromARGB(
                                                  170, 95, 95, 95),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            status,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Color.fromARGB(
                                                  170, 95, 95, 95),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("Description"),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(170, 95, 95, 95),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          //image section

          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                  margin: EdgeInsets.only(left: 5, right: 8, bottom: 4),
                  // color: Colors.yellow,
                  width: 80,
                  height: 100,
                  child: Center(child: Image.network(imageSrc))),
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
                height: 2,
                child: IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 25,
                      color: pieChartEmptyColor,
                    ),
                    onPressed: () {})),
          )
        ],
      ),
    );
  }
}
