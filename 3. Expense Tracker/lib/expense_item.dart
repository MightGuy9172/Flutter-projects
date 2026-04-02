import 'package:expense_tracker/model/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseItem, {super.key});

  final ExpenseModel expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseItem.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('₹${expenseItem.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenseItem.category]),
                    SizedBox(
                      width: 6,
                    ),
                    Text(expenseItem.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
