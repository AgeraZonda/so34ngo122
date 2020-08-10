// Copyright 2017, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:so34ngo122/widgets/ExpensesScreen.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/Expense.dart';

void main() {
  runApp(MaterialApp(
    home: ExpensesScreen(
      expenses: List.generate(
        20,
        (i) => Expense(
          '1',
          'Expense $i',
          5,
          'A description of what needs to be done for Expense $i',
        ),
      ),
    ),
  ));
}
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final FirebaseApp app = await FirebaseApp.configure(
//     name: 'test',
//     options: const FirebaseOptions(
//       googleAppID: '1:234307915271:android:6af840d1e061fbc17c64a2',
//       gcmSenderID: '234307915271',
//       apiKey: 'AIzaSyB-p4BP3aoKanlgzGT1heSmriOHtCpsObg',
//       projectID: 'so34ngo112',
//     ),
//   );
//   final Firestore firestore = Firestore(app: app);

//   runApp(MaterialApp(
//       title: 'Firestore Example', home: MyHomePage(firestore: firestore)));
// }

//Future<void> main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  final FirebaseApp app = await FirebaseApp.configure(
//    name: 'test',
//    options: const FirebaseOptions(
//      googleAppID: '1:960539170822:android:65096dc8a9d051158f4b87',
//      gcmSenderID: '960539170822',
//      apiKey: 'AIzaSyBHGZSlJeIWXxbJr9TKwuc2-CWlKeoj1iI',
//      projectID: 'so34ngo122-700dc',
//    ),
//  );
//  final Firestore firestore = Firestore(app: app);
//  print(firestore);
//  runApp(MaterialApp(
//    title: 'Passing Data',
//    home: ExpensesScreen(
//      expenses: List.generate(
//        20,
//            (i) => Expense('1',
//          'Expense $i',
//          5,
//          'A description of what needs to be done for Expense $i',
//        ),
//      ),
//    ),
//  ));
//}
////
////void main() {
////  Api _api =  Api();
//////
//////  List<Expense> expenses;
//////
//////
//////  Future<List<Expense>> fetchExpenses() async {
//////    var result = await _api.getDataCollection();
//////    expenses = result.documents
//////        .map((doc) => Expense.fromMap(doc.data, doc.documentID))
//////        .toList();
//////    return expenses;
//////  }
////  runApp(MaterialApp(
////    title: 'Passing Data',
////    home: ExpensesScreen(
////      expenses: List.generate(
////        20,
////            (i) => Expense('1',
////          'Expense $i',
////          5,
////          'A description of what needs to be done for Expense $i',
////        ),
////      ),
////    ),
////  ));
////}
//
////void main() {
////  setupLocator();
////  runApp(MyApp());
////}
////
////class MyApp extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    return MultiProvider(
////      providers: [
////        ChangeNotifierProvider(builder: (_) => locator<CRUDModel>()),
////      ],
////      child: MaterialApp(
////        debugShowCheckedModeBanner: false,
////        initialRoute: '/',
////        title: 'Product App',
////        theme: ThemeData(),
////        onGenerateRoute: Router.generateRoute,
////      ),
////    );
////  }
////}
