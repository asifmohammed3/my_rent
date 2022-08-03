import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

class ExpensePieChart extends StatefulWidget {
  const ExpensePieChart({Key? key}) : super(key: key);

  @override
  State<ExpensePieChart> createState() => _ExpensePieChartSectionState();
}

class _ExpensePieChartSectionState extends State<ExpensePieChart> {
  get pieChartEmptyColor => null;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
          centerSpaceRadius: 65,
          borderData: FlBorderData(
            show: true,
          ),
          startDegreeOffset: 180,
          sectionsSpace: 0,
          sections: [
            //water
            PieChartSectionData(
              radius: 15,
              showTitle: false,
              value: 1000,
              color: Color.fromARGB(255, 91, 155, 213),
            ),
            //internet
            PieChartSectionData(
              radius: 15,
              showTitle: false,
              value: 1000,
              color: Color.fromARGB(255, 67, 104, 43),
            ),
            //Electricity
            PieChartSectionData(
              radius: 15,
              showTitle: false,
              value: 500,
              color: Color.fromARGB(255, 112, 173, 71),
            ),
            //Services
            PieChartSectionData(
              radius: 15,
              showTitle: false,
              value: 250,
              color: Color.fromARGB(255, 255, 192, 0),
            ),
          ]),
    );
  }
}
