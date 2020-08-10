import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:so34ngo122/models/Expense.dart';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
class DatabaseService {
  DatabaseService();

  // collection reference
  final CollectionReference expenseCollection =
      Firestore.instance.collection('expenses');

  Future<void> addExpense(
      String title, int price, String description, String date) async {
    return await expenseCollection
        .add({
          'title': title,
          'price': price,
          'description': description,
          'date': date,
        })
        .then((value) => print("Added"))
        .catchError((error) => print("Failed to add user: $error"));
    ;
  }

  Future<List<Expense>> getListExpense() async {
    QuerySnapshot qShot =
        await Firestore.instance.collection('expenses').getDocuments();

    return qShot.documents
        .map((doc) => Expense(
              doc.data['id'],
              doc.data['title'],
              doc.data['price'],
              doc.data['description'],
              doc.data['date'],
            ))
        .toList();
  }
  // Future<T> load<T>(Resource<T> resource) async {

  //     final response = await http.get(resource.url);
  //     if(response.statusCode == 200) {
  //       return resource.parse(response);
  //     } else {
  //       throw Exception('Failed to load data!');
  //     }
  // }
}
// class Resource<T> {
//   final String url;
//   T Function(Response response) parse;

//   Resource({this.url,this.parse});
// }
