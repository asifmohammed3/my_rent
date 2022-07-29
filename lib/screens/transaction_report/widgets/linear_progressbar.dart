import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: LinearProgressIndicator(
              value: 0.5,
              color: bottomNavYellow,
              backgroundColor: pieChartEmptyColor,
              minHeight: 7,
            )),
      ),
    );
  }
}
