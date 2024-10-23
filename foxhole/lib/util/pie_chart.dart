// import 'package:pie_chart/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChartWidget extends StatefulWidget {
  const CustomPieChartWidget({super.key});

  @override
  State<CustomPieChartWidget> createState() {
    return _CustomPieChartWidgetState();
  }
}

class _CustomPieChartWidgetState extends State<CustomPieChartWidget> {
  Map<String, double> dataMap = {
    "Income": 3, //have a function that conputes and returns a value for income
    "Expenses":
        5, //have a function that conputes and returns a value for expenses
    "Payments":
        5, //have a function that conputes and returns a value for payments
    "Investments":
        5, //have a function that conputes and returns a value for Investments
    "Other":
        2, //have a function that conputes and returns a value for unassigned value
  };

  double strokeRadius = 24;
  double strokeWidth = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
     
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),  color: Colors.white,),
      child: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: const Color.fromRGBO(33, 158, 188, 1),
                  value: 25,
                  showTitle: false,
                  radius: strokeRadius,
                  borderSide:  BorderSide(
                      color: Colors.white, width: strokeWidth), // Gap effect
                ),
                PieChartSectionData(
                  color: const Color.fromRGBO(2, 48, 71, 1),
                  value: 30,
                  showTitle: false,
                  radius: strokeRadius,
                  borderSide:  BorderSide(
                      color: Colors.white, width: strokeWidth), // Gap effect
                ),
                PieChartSectionData(
                  color: const Color.fromRGBO(255, 183, 3, 1),
                  value: 20,
                  showTitle: false,
                  radius: strokeRadius,
                  borderSide: BorderSide(
                      color: Colors.white, width: strokeWidth), // Gap effect
                ),
                PieChartSectionData(
                  color: const Color.fromRGBO(251, 133, 0, 1),
                  value: 15,
                  showTitle: false,
                  radius: strokeRadius,
                  borderSide:  BorderSide(
                      color: Colors.white, width: strokeWidth), // Gap effect
                ),
                PieChartSectionData(
                  color: const Color.fromRGBO(142, 202, 230, 1),
                  value: 10,
                  showTitle: false,
                  radius: strokeRadius,

                  borderSide: BorderSide(
                      color: Colors.white, width: strokeWidth), // Gap effect
                ),
              ],
              centerSpaceRadius: 138, // Size of the inner hole
              sectionsSpace: 4, // Space between sections
            ),
          ),
        ),
      ),
    );
  }
}
