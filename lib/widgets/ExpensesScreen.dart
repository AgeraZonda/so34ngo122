import 'package:flutter/material.dart';
import 'package:so34ngo122/models/Expense.dart';
import 'package:so34ngo122/models/User.dart';

import 'AddScreen.dart';
import 'DetailScreen.dart';
import 'ExpenseList.dart';

class ExpensesScreen extends StatelessWidget {
  final List<Expense> expenses;
  final List<User> listUser;
  ExpensesScreen({Key key, @required this.expenses, @required this.listUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expenses'),
        ),
        body: ExpenseList(
          expenses: expenses,
          listUser: listUser,
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
