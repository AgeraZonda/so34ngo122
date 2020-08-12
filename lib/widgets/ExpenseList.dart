import 'package:flutter/material.dart';
import 'package:so34ngo122/models/Expense.dart';
import 'package:so34ngo122/models/User.dart';
import 'package:so34ngo122/widgets/TableWidget.dart';

import 'DetailScreen.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final List<User> listUser;
  final Function setStates;
  ExpenseList(
      {Key key,
      @required this.expenses,
      @required this.listUser,
      @required this.setStates})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      FlatButton(
          child: Text('Refresh'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: setStates),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableWidget(
          listUser: listUser,
        ),
      ),
      Expanded(
          child: SizedBox(
              height: 200.0,
              child: Container(
                width: size.width,
                child: new ListView.separated(
                  itemCount: expenses.length,
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      // : [BoxShadow(blurRadius: 50,
                      // offset: Offset(0,10),
                      // color: Colors.grey)],
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, //Center Column contents vertically,
// crossAxisAlignment: CrossAxisAlignment.center //Center Column contents horizontally,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                expenses[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Text(
                              expenses[index].price.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 14),
                            ),
                          ],
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
                      ),
                    );
                  },
                ),
              )))
    ]);
  }
}
