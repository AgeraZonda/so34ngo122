//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter_app/core/models/Expense.dart';
//
//import 'Api.dart';
//
//class CRUDModel extends ChangeNotifier {
//  Api _api = locator<Api>();
//
//  List<Expense> expenses;
//
//
//  Future<List<Expense>> fetchExpenses() async {
//    var result = await _api.getDataCollection();
//    expenses = result.documents
//        .map((doc) => Expense.fromMap(doc.data, doc.documentID))
//        .toList();
//    return expenses;
//  }
//
//  Stream<QuerySnapshot> fetchExpensesAsStream() {
//    return _api.streamDataCollection();
//  }
//
//  Future<Expense> getExpenseById(String id) async {
//    var doc = await _api.getDocumentById(id);
//    return  Expense.fromMap(doc.data, doc.documentID) ;
//  }
//
//
//  Future removeExpense(String id) async{
//    await _api.removeDocument(id) ;
//    return ;
//  }
//  Future updateExpense(Expense data,String id) async{
//    await _api.updateDocument(data.toJson(), id) ;
//    return ;
//  }
//
//  Future addExpense(Expense data) async{
//    var result  = await _api.addDocument(data.toJson()) ;
//
//    return ;
//
//  }
//
