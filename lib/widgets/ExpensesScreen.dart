import 'package:flutter/material.dart';
import 'package:so34ngo122/models/Expense.dart';

import 'AddScreen.dart';
import 'DetailScreen.dart';

class ExpensesScreen extends StatelessWidget {
  final List<Expense> expenses;
  ExpensesScreen({Key key, @required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expenses'),
        ),
        body: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                expenses[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // When a user taps the ListTile, navigate to the DetailScreen.
              // Notice that you're not only creating a DetailScreen, you're
              // also passing the current expense through to it.
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(expense: expenses[index]),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddScreen(),
              ),
            );
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
