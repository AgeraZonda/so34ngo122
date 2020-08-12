import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:so34ngo122/models/Expense.dart';
import 'package:so34ngo122/models/User.dart';

import 'AddScreen.dart';
import 'DetailScreen.dart';
import 'ExpenseList.dart';

class ExpensesScreen extends StatelessWidget {
  final List<Expense> expenses;
  final List<User> listUser;
  final Function setStates;
  ExpensesScreen(
      {Key key,
      @required this.expenses,
      @required this.listUser,
      @required this.setStates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<String>(
      //                    <--- Consumer
      builder: (context, name, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Expenses'),
            ),
            body: ExpenseList(
                expenses: expenses, listUser: listUser, setStates: setStates),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddScreen(listUser, name),
                  ),
                );
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ));
      },
    );
  }
}
