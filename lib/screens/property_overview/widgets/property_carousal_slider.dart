// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:my_rent/constants/color_constants.dart';
// import 'package:my_rent/global_variables/global.dart';

// class PropertyCarouselSlider extends StatefulWidget {
//   @override
//   State<PropertyCarouselSlider> createState() => _PropertyCarouselSliderState();
// }

// class _PropertyCarouselSliderState extends State<PropertyCarouselSlider> {
//   @override
//   Widget build(BuildContext context) {
//     bool propertyTileSelected = true;
//     List<int> list = [1, 2, 3, 4, 5];
//     return Container(
//         height: 230,
//         child: CarouselSlider(
//           options: CarouselOptions(
//             pageSnapping: false,
//             padEnds: false,
//             enableInfiniteScroll: false,
//             disableCenter: true,
//           ),
//           items: list
//               .map((item) => Padding(
//                     padding: EdgeInsets.only(
//                         bottom: 18.0, left: 18, right: 18, top: 0),
//                     child: Container(
//                       // color: Colors.yellow,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 23.0, right: 23.0),
//                         child: InkWell(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: propertyTileSelected
//                                       ? bottomNavYellow
//                                       : Colors.grey,
//                                   width: propertyTileSelected ? 5 : 1),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(20),
//                               ),
//                             ),
//                           ),
//                           onTap: () {
//                             print(
//                                 "propertytile${item} :${propertyTileSelected}");
//                             setState(() {
//                               propertyTileSelected = !propertyTileSelected;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   ))
//               .toList(),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/widgets/property_tile.dart';
import 'package:my_rent/screens/property_overview/property_overview.dart/screen_property_overview.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';

class PropertyCarousalSlider extends StatefulWidget {
  PropertyCarousalSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<PropertyCarousalSlider> createState() => _PropertyCarousalSliderState();
}

class _PropertyCarousalSliderState extends State<PropertyCarousalSlider> {
  bool propertyTileselction = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (index) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            setState(() {
              propertyTileselction = !propertyTileselction;
              print(index);
            });
          },
          child: Container(
            width: 195,
            decoration: propertyTileselction
                ? BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2.8, color: bottomNavYellow),
                    borderRadius: const BorderRadius.all(Radius.circular(20)))
                : BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.5, color: Colors.grey.shade300),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.network(
                    "https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?auto=compress&cs=tinysrgb&w=1600",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Property Name",
                          style: TextStyle(
                              color: customBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Branch location",
                          style: TextStyle(
                              color: customBlue,
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_sharp,
                              color: pieChartEmptyColor2,
                              size: 15,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "1 Tenent",
                              style: TextStyle(
                                  color: pieChartEmptyColor2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(), primary: customBlue),
                          child: Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                              )),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ScreenPropertyOverview();
                            }));
                          },
                        ))
                  ],
                ),
              )
            ]),
          ),
        ),
      );
    });
  }
}
