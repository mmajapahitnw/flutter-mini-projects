import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  // add new expense
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Add new expense'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // input for expense name
                TextField(),
                // input for expense amount
                TextField(),
              ],
            ),
            actions: [
              MaterialButton(
                onPressed: save,
                child: Text('Save'),
              ),
              MaterialButton(
                onPressed: cancel,
                child: Text('Cancel'),
              )
            ],
          ),
    );
  }

  void save() {
    // create new expense item
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: newExpenseAmountController.text,
      dateTime: DateTime.now(),
    );

    // add the new expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
  }

  void cancel() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(builder: (context, value, child) =>
      Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) =>
            ListTile(
              title: Text(
                value.getOverallExpenseList()[index].name,
              ),
            ),
        ),
      ),
    );
  }
}
