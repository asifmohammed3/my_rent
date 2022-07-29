import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';

class PropertyUnitPieChart extends StatefulWidget {
  const PropertyUnitPieChart({Key? key}) : super(key: key);

  @override
  State<PropertyUnitPieChart> createState() => _PropertyUnitPieChartState();
}

class _PropertyUnitPieChartState extends State<PropertyUnitPieChart> {
  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(
        centerSpaceRadius: 25,
        borderData: FlBorderData(
          show: false,
        ),
        startDegreeOffset: 180,
        sectionsSpace: 0,
        sections: [
          PieChartSectionData(
            radius: 8,
            showTitle: false,
            value: 1,
            color: pieChartEmptyColor,
          ),
          PieChartSectionData(
            radius: 8,
            showTitle: false,
            value: 3,
            color: custLightGreen,
          ),
        ]));
  }
}
