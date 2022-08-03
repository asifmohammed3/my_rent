import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

class LinearProgressBar extends StatelessWidget {
  LinearProgressBar(
      {Key? key,
      required this.value,
      this.color = bottomNavYellow,
      this.width = 7,
      this.showLabel = false})
      : super(key: key);
  double value;
  Color color;
  double width;
  bool showLabel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(
                value: value,
                color: color,
                backgroundColor: pieChartEmptyColor,
                minHeight: width,
              ),
            ),
            showLabel
                ? Center(
                    child: Text("1/2"),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
