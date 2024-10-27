// import 'package:pie_chart/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class CustomPieChartWidget extends StatefulWidget {
  final double income;
  final double expenses;
  final double savings;
  final double investments;
  final double other;

  const CustomPieChartWidget({
    super.key,
    required this.income,
    required this.expenses,
    required this.savings,
    required this.investments,
    required this.other,
  });

  @override
  State<CustomPieChartWidget> createState() {
    return _CustomPieChartWidgetState();
  }
}

class _CustomPieChartWidgetState extends State<CustomPieChartWidget> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Income": widget.income,
      "Expenses": widget.expenses,
      "Savings": widget.savings,
      "Investments": widget.investments,
      "Other": widget.other,
    };

    double strokeRadius = 24;
    double strokeWidth = 4;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: PieChart(
            PieChartData(
              sections: dataMap.entries.map((entry) {
                return PieChartSectionData(
                  color: getColorForCategory(entry.key),
                  value: entry.value,
                  showTitle: false,
                  radius: strokeRadius,
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: strokeWidth,
                  ),
                );
              }).toList(),
              centerSpaceRadius: 138,
              sectionsSpace: 4,
            ),
          ),
        ),
      ),
    );
  }

  Color getColorForCategory(String category) {
    switch (category) {
      case 'Income':
        return const Color.fromRGBO(33, 158, 188, 1);
      case 'Expenses':
        return const Color.fromRGBO(2, 48, 71, 1);
      case 'Savings':
        return const Color.fromARGB(255, 255, 137, 3);
      case 'Investments':
        return const Color.fromARGB(255, 29, 87, 37);
      case 'Other':
        return const Color.fromRGBO(142, 202, 230, 1);
      default:
        return Colors.grey;
    }
  }
}
