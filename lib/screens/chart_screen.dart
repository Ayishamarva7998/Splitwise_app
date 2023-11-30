
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:splitwise_app/functions/expense_fn.dart';


class chart extends StatefulWidget {
  const chart({Key? key}) : super(key: key);

  @override
  State<chart> createState() => _chartState();
}

class _chartState extends State<chart> {
  @override
  Widget build(BuildContext context) {
    List foods = expenseListNotifier.value;
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 22, 140, 124),
          title: const Text(
            'chart',
            style: TextStyle(color: Colors.white),
          ),
          
        ),
        body: TabBarView(
          children: [chartt(expense: foods)],
        ),
      ),
    );
  }
}

Widget chartt({required expense}) {
  return ValueListenableBuilder(
    valueListenable: expenseListNotifier,
    builder: (context, value, child) {
      return SizedBox(
        height: 500,
        child: PieChart(
          PieChartData(
            sections: List.generate(
              expense.length,
              (index) {
                double cost = double.parse(expense[index].amount);
                double totalCost = calculateTotalCost(expense);
                double percentage = (cost / totalCost) * 100;
                final name = expense[index].description;

                return PieChartSectionData(
                  badgePositionPercentageOffset: 1.1,
                  titlePositionPercentageOffset: .4,
                  color: getRandomColor(),
                  
                  value: percentage,
                  title: ''' ${cost.toStringAsFixed(2)}
      (${percentage.toStringAsFixed(2)}%)
      $name
      ''',
                  radius: 50,
                  titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                );
              },
            ),
            sectionsSpace: 5,
            centerSpaceRadius: 90,
            startDegreeOffset: 0,
          ),
        ),
      );
    },
  );
}

Color getRandomColor() {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}