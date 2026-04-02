import 'package:expense_tracker/chart/chart.dart';
import 'package:expense_tracker/expense_detail.dart';
import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';

class ExpenseHome extends StatefulWidget {
  const ExpenseHome({super.key});

  @override
  State<ExpenseHome> createState() {
    return _ExpenseHomeState();
  }
}

class _ExpenseHomeState extends State<ExpenseHome> {
  List<ExpenseModel> expenses = [];

  void showModal() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return NewExpense(
          onAddExpense: _addExpense,
        );
      },
    );
  }

  void _addExpense(ExpenseModel expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    final expenseIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = Center(
      child: Text('No Expenses, Start adding Some !'),
    );

    if (expenses.isNotEmpty) {
      mainContent = ExpenseDetail(expenses, _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Home"),
        actions: [
          IconButton(
            onPressed: showModal,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: width < 500
          ? Column(
              children: [
                Chart(expenses: expenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: expenses)),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
