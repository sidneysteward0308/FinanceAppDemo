import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChartWidget extends StatefulWidget {
  final double income;
  final double expenses;
  final double savings;
  final double investments;

  const CustomPieChartWidget({
    super.key,
    required this.income,
    required this.expenses,
    required this.savings,
    required this.investments,
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
      "Income": widget.income.isNaN ? 0 : widget.income,
      "Expenses": widget.expenses.isNaN ? 0 : widget.expenses,
      "Savings": widget.savings.isNaN ? 0 : widget.savings,
      "Investments": widget.investments.isNaN ? 0 : widget.investments,
    };

    List<PieChartSectionData> sections = dataMap.entries
        .where((entry) => entry.value > 0)
        .map((entry) {
          return PieChartSectionData(
            color: getColorForCategory(entry.key),
            value: entry.value,
            showTitle: false,
            radius: 24,
            borderSide: const BorderSide(
              color: Colors.white,
              width: 4,
            ),
          );
        })
        .toList();

    if (sections.isEmpty) {
      sections.add(
        PieChartSectionData(
          color: Colors.grey.shade300,
          value: 1, 
          showTitle: false,
          radius: 24,
          borderSide: const BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
      );
    }

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
              sections: sections,
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
        return const Color.fromARGB(255, 208, 153, 35);
      case 'Savings':
        return const Color.fromARGB(255, 255, 137, 3);
      case 'Investments':
        return const Color.fromARGB(255, 29, 87, 37);
      default:
        return Colors.grey;
    }
  }
}
