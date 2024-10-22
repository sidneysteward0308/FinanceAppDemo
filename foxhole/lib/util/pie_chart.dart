import 'package:pie_chart/pie_chart.dart';
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
    "Expenses": 5,//have a function that conputes and returns a value for expenses
    "Payments": 5,//have a function that conputes and returns a value for payments
    "Investments": 5,//have a function that conputes and returns a value for Investments
    "Other": 2, //have a function that conputes and returns a value for unassigned value
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(50), // Match this with outer Container
      ),
      padding: EdgeInsets.all(20),
      width: 400,
      height: 380,
      child: PieChart(
        
        animationDuration: const Duration(seconds: 1), 
        ringStrokeWidth: 15,
        dataMap: dataMap,
        chartType: ChartType.ring,
        baseChartColor:
            const Color.fromARGB(255, 179, 178, 178)!.withOpacity(0.15),
        chartValuesOptions: const ChartValuesOptions(
          showChartValuesInPercentage: true,
        ),
        totalValue: 20,
        legendOptions: const LegendOptions(
          showLegends: false, // This hides the legend
        ),
        colorList: const [
          Color.fromRGBO(33, 158, 188, 1),
          Color.fromRGBO(2, 48, 71, 1),
          Color.fromRGBO(255, 183, 3, 1),
          Color.fromRGBO(251, 133, 0, 1),
          Color.fromRGBO(142, 202, 230, 1),
        ],
      ),
    );
  }
}
