import 'package:flutter/material.dart';
import 'package:so34ngo122/models/Expense.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Expense.
  final Expense expense;

  // In the constructor, require a Expense.
  DetailScreen({Key key, @required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Expense to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(expense.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(expense.description),
      ),
    );
  }
}
