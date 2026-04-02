import 'package:expense_tracker/expense_item.dart';
import 'package:expense_tracker/model/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseDetail extends StatelessWidget {
  const ExpenseDetail(this.expenses, this.onRemoveExpense, {super.key});

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
