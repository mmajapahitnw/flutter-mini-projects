import 'package:expense_tracker/bar_graph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/date_time/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    // get yyyymmdd for each day in this week
    String monday = convertDateTimeToString(startOfWeek.add(Duration(days: 0)));
    String tuesday = convertDateTimeToString(startOfWeek.add(Duration(days: 1)));
    String wednesday = convertDateTimeToString(startOfWeek.add(Duration(days: 2)));
    String thursday = convertDateTimeToString(startOfWeek.add(Duration(days: 3)));
    String friday = convertDateTimeToString(startOfWeek.add(Duration(days: 4)));
    String saturday = convertDateTimeToString(startOfWeek.add(Duration(days: 5)));
    String sunday = convertDateTimeToString(startOfWeek.add(Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: 100,
          monAmount: 5,
          tueAmount: 43,
          wedAmount: 56,
          thuAmount: 23,
          friAmount: 65,
          satAmount: 90,
          sunAmount: 99,
        ),
      ),
    );
  }
}
