import 'package:expense_tracker_app/datetime/date_time_helper.dart';
import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  List<ExpenseItem> overallExpenseList = [];

  List<ExpenseItem> getallItenList() {
    return overallExpenseList;
  }

  // Add Expneses
  void addnewExpenses(ExpenseItem newItem) {
    overallExpenseList.add(newItem);
    notifyListeners();
  }

  //Delete Expenses
  void deleteExpense(ExpenseItem expenses) {
    overallExpenseList.remove(expenses);
    notifyListeners();
  }

  String getDayname(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';

      default:
        return "";
    }
  }

  DateTime startofWeekday() {
    DateTime? startofweek;

    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getDayname(today.subtract(Duration(days: i))) == "Sun") {
        startofweek = today.subtract(Duration(days: i));
      }
    }
    return startofweek!;
  }

  Map<String, double> calculateDailyExpenses() {
    Map<String, double> dailyExpenses = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimetoString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenses.containsKey(date)) {
        double currentAmount = dailyExpenses[date]!;
        currentAmount += amount;
        dailyExpenses[date] = currentAmount;
      } else {
        dailyExpenses.addAll({date: amount});
      }
    }

    return dailyExpenses;
  }
}
