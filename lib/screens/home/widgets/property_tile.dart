import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/widgets/pie_chart.dart';

class PropertyTile extends StatelessWidget {
  PropertyTile(
      {Key? key,
      required this.propertyName,
      required this.branchLocation,
      this.numberOfUnits = "",
      required this.imageSrc})
      : super(key: key);

  String propertyName;
  String branchLocation;
  String numberOfUnits;
  String imageSrc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 100,
        // color: Colors.red,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  color: Color.fromARGB(255, 250, 250, 250),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(17.0),
                    bottomRight: Radius.circular(17.0),
                  ),
                ),
              ),
            ),
            //image section
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: 110,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageSrc),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  border: Border.all(
                    color: bottomNavYellow,
                    width: 1.5,
                  ),
                ),
              ),
            ),

            //text section
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Container(
                    // color: Colors.blue,
                    width: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          propertyName,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: customBlue),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Color.fromARGB(170, 95, 95, 95),
                              size: 17,
                            ),
                            SizedBox(width: 3),
                            Text(
                              branchLocation,
                              style: TextStyle(
                                color: Color.fromARGB(170, 95, 95, 95),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.home,
                              color: Color.fromARGB(170, 95, 95, 95),
                              size: 17,
                            ),
                            SizedBox(width: 3),
                            Text(
                              "${numberOfUnits} Units",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(170, 95, 95, 95),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //pie chart section

            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 4),
                    // color: Colors.yellow,
                    width: 80,
                    height: 100,
                    child: Center(
                        child: Text(
                      "3/4",
                      style: TextStyle(
                        color: Color.fromARGB(180, 95, 95, 95),
                      ),
                    ))),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, right: 5, bottom: 4),
                child: SizedBox(
                    width: 80, height: 100, child: PropertyUnitPieChart()),
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
      ),
    );
  }
}
