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
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  //double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _usernameTextController
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

  Future addExpense(String title, int price, String description) async {
    try {
      await DatabaseService(uid: '1').updateUserData(title, price, description);
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
              controller: _firstNameTextController,
              decoration: InputDecoration(hintText: 'Mua cái gì vậy ?'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration:
                  InputDecoration(hintText: 'Bao nhiêu tiền nhớ không ??'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'NOTE: thường là phế =))'),
            ),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () async {
              dynamic result = await addExpense('thịt', 1000, 'kcogi');
              print(result);
            },
            child: Text('Thêm luôn'),
          ),
        ],
      ),
    );
  }
}
