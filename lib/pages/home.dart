import 'package:expense_tracker_app/data/expense_data.dart';
import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  void addnewExpenses() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add New Expenses"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: amountController,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text("Save"),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text("Cancel"),
          )
        ],
      ),
    );
  }

  void save() {
    ExpenseItem newexpense = ExpenseItem(
      title: nameController.text,
      amount: amountController.text,
      dateTime: DateTime.now(),
    );
    Provider.of<ExpenseData>(context, listen: false).addnewExpenses(newexpense);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: addnewExpenses,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: ListView.builder(
            itemCount: value.getallItenList().length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                value.getallItenList()[index].title,
              ),
              subtitle: Text(value.getallItenList()[index].dateTime.toString()),
              trailing: Text('\$' + value.getallItenList()[index].amount),
            ),
          ),
        );
      },
    );
  }
}
