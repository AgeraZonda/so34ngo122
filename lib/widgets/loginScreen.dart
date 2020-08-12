import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:so34ngo122/models/Expense.dart';
import 'package:so34ngo122/services/DatabaseService.dart';
import 'package:so34ngo122/widgets/ExpensesScreen.dart';

import '../main.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFromState createState() => LoginFromState();
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the Expense to create the UI.
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginFromState extends State<LoginForm> {
  final _nameTextController = TextEditingController();
  List<Expense> listExpense = List<Expense>();
  Future<List<Expense>> getListExpense() async {
    List<Expense> tasks = await DatabaseService().getListExpense();

    return tasks;
  }

  LoginFromState() {
    getListExpense().then((value) => setState(() {
          listExpense = value;
        }));
  }

  void _updateFormProgress() {}

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Cho tớ xin một cái tên xinh đẹp nào',
              style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameTextController,
              decoration:
                  InputDecoration(hintText: 'Set NickName trước nha em êi'),
            ),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.setString('username', _nameTextController.text);
              await DatabaseService().addUser(_nameTextController.text, 0);
              if (listExpense.length != 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              }
            },
            child: Text('Thêm luôn'),
          ),
        ],
      ),
    );
  }
}
