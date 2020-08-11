import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:so34ngo122/models/WhoUse.dart';
import 'package:so34ngo122/services/DatabaseService.dart';
import 'package:provider/provider.dart';

class AddForm extends StatefulWidget {
  @override
  AddFromState createState() => AddFromState();
}

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the Expense to create the UI.
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: AddForm(),
      ),
    );
  }
}

class AddFromState extends State<AddForm> {
  final _titleTextController = TextEditingController();
  final _priceTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  final _dateTextController = TextEditingController();

  //double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      _titleTextController,
      _priceTextController,
      _descriptionTextController,
      _dateTextController
    ];
    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

//    setState(() {
//      _formProgress = progress;
//    });
  }

  void _showWelcomeScreen() {
    Navigator.pop(context);
  }

  Future addExpense(String title, int price, String description, String date,
      String whoUse) async {
    try {
      await DatabaseService()
          .addExpense(title, price, description, date, whoUse);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future editUserWallet(String name, int wallet) async {
    try {
      await DatabaseService().editUserWallet(name, wallet);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  List<String> _nickname = new List<String>();

  Map<String, bool> listResult = new Map<String, bool>();
  int currentValue = 0;
  int groupId = 0;
  AddFromState() {
    _nickname.add('agera');
    _nickname.add('vy');
    _nickname.add('anh');
    _nickname.add('duy');
    DateTime today = new DateTime.now();
    String dateSlug =
        "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    _dateTextController.text = dateSlug;
    for (String name in _nickname) {
      listResult.addAll({name: true});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Thêm nè', style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _titleTextController,
              decoration: InputDecoration(hintText: 'Mua cái gì vậy ?'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _priceTextController,
              decoration:
                  InputDecoration(hintText: 'Bao nhiêu tiền nhớ không ??'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _descriptionTextController,
              decoration: InputDecoration(hintText: 'NOTE: thường là phế =))'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _dateTextController,
              decoration: InputDecoration(
                  hintText: 'Chắc là hôm nay nhỉ, hôm khác thì điền'),
            ),
          ),
          Consumer<String>(
            //                    <--- Consumer
            builder: (context, name, child) {
              return FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async {
                  String a = '[';
                  int price = int.parse(_priceTextController.text);
                  int countPeople = 0;
                  listResult.forEach((key, value) {
                    a += '{"name": "${key}", "isUse": ${value}},';
                    if (value) countPeople++;
                  });
                  double priceForOtherPerson = price / countPeople;
                  double priceForPerson = price - priceForOtherPerson;
                  listResult.forEach((key, value) {
                    if (value) {
                      if (key == name)
                        editUserWallet(key, priceForPerson.round());
                      else
                        editUserWallet(key, -priceForOtherPerson.round());
                    }
                  });
                  a = a.substring(0, a.length - 1);
                  a += ']';
                  // dynamic halo = await editUserWallet('agera', 500);
                  dynamic result = await addExpense(
                      _titleTextController.text,
                      int.parse(_priceTextController.text),
                      _descriptionTextController.text,
                      _dateTextController.text,
                      '{"whoUse":' + a + '}');
                },
                child: Text('Thêm luôn'),
              );
            },
          ),
          Consumer<String>(
              //                    <--- Consumer
              builder: (context, name, child) {
            return Column(
              children: _nickname
                  .map(
                    (item) => CheckboxListTile(
                        title: Text(name == item ? 'Bạn: ' + item : item),
                        value: listResult[item],
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            if (name != item)
                              listResult[item] = !listResult[item];
                          });
                        }),
                  )
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}
