import 'package:flutter/material.dart';
import 'package:so34ngo122/models/Expense.dart';
import 'package:so34ngo122/models/User.dart';
import 'package:so34ngo122/widgets/TableWidget.dart';

import 'DetailScreen.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final List<User> listUser;
  ExpenseList({Key key, @required this.expenses, @required this.listUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      TableWidget(
        listUser: listUser,
      ),
      Expanded(
          child: SizedBox(
              height: 200.0,
              child: new ListView.separated(
                itemCount: expenses.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
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
              )))
    ]);
  }
}
