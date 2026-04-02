import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { food, movie, shop, travel }

const uuid = Uuid();
final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.dining_outlined,
  Category.movie: Icons.movie,
  Category.shop: Icons.shopping_bag_sharp,
  Category.travel: Icons.flight,
};

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});

  ExpenseBucket.forCategory(List<ExpenseModel> allExpense, this.category)
    : expenses = allExpense
          .where((expense) => expense.category == category)
          .toList();

  final Category category;
  final List<ExpenseModel> expenses;

  double get totalExpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
