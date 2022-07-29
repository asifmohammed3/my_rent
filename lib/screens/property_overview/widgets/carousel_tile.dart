import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PropertyCarouselSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Container(
        height: 250,
        child: CarouselSlider(
          options: CarouselOptions(
            pageSnapping: false,
            padEnds: false,
            enableInfiniteScroll: false,
            disableCenter: true,
          ),
          items: list
              .map((item) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ));
  }
}
