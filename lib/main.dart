// Copyright 2017, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:so34ngo122/services/AuthService.dart';
import 'package:so34ngo122/services/DatabaseService.dart';
import 'package:so34ngo122/widgets/ExpensesScreen.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/Expense.dart';
import 'models/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;
  List<Expense> listExpense = List<Expense>();
  Future<List<Expense>> getListExpense() async {
    List<Expense> tasks = await DatabaseService().getListExpense();

    return tasks;
  }

  _MyAppState() {
    getListExpense().then((value) => setState(() {
          listExpense = value;
        }));
  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: listExpense.length != 0
            ? ExpensesScreen(expenses: listExpense)
            : Text('loading'),
      ),
    );
  }
}
