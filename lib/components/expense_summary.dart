// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_tracker_app/Bar%20graph/bar_graph.dart';
import 'package:expense_tracker_app/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startofweek;
  const ExpenseSummary({
    Key? key,
    required this.startofweek,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(builder: (context, value, child) {
      return SizedBox(
        height: 200,
        child: BarGraph(
          maxY: 100,
          sunAmount: 20,
          monAmount: 40,
          tueAmount: 50,
          wedAmount: 60,
          thuAmount: 70,
          friAmount: 95,
          satAmount: 45,
        ),
      );
    });
  }
}
