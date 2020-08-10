import 'package:flutter/material.dart';
import 'package:so34ngo122/services/DatabaseService.dart';

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
  AddFromState() {
    DateTime today = new DateTime.now();
    String dateSlug =
        "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    _dateTextController.text = dateSlug;
  }
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

  Future addExpense(
      String title, int price, String description, String date) async {
    try {
      await DatabaseService().addExpense(title, price, description, date);
    } catch (error) {
      print(error.toString());
      return null;
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
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () async {
              dynamic result = await addExpense(
                  _titleTextController.text,
                  int.parse(_priceTextController.text),
                  _descriptionTextController.text,
                  _dateTextController.text);
            },
            child: Text('Thêm luôn'),
          ),
        ],
      ),
    );
  }
}
