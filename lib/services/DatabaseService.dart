import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:so34ngo122/models/Expense.dart';
import 'package:so34ngo122/models/User.dart';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
class DatabaseService {
  DatabaseService();

  // collection reference
  final CollectionReference expenseCollection =
      Firestore.instance.collection('expenses');
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future<void> addExpense(String title, int price, String description,
      String date, String whoUse, String whoMade) async {
    return await expenseCollection.add({
      'title': title,
      'price': price,
      'description': description,
      'date': date,
      'whoUse': whoUse,
      'whoMade': whoMade,
    }).catchError((error) => print("Failed to add expense: $error"));
    ;
  }

  Future<void> addUser(String name, int wallet) async {
    return await userCollection.add({
      'name': name,
      'wallet': wallet,
    }).catchError((error) => print("Failed to add user: $error"));
    ;
  }

  Future<void> editUserWallet(String name, int wallet) async {
    var documentID = 'hello';
    var currentWallet = 0;
    await userCollection.getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        if (result.data['name'] == name) {
          documentID = result.documentID;
          currentWallet = result.data['wallet'];
        }
      });
    });
    return await userCollection
        .document(documentID)
        .setData({"name": name, "wallet": currentWallet + wallet});
  }

  Future<List<Expense>> getListExpense() async {
    QuerySnapshot qShot = await expenseCollection.getDocuments();

    return qShot.documents
        .map((doc) => Expense(
            doc.data['id'],
            doc.data['title'],
            doc.data['price'],
            doc.data['description'],
            doc.data['date'],
            doc.data['whoUse'],
            doc.data['whoMade']))
        .toList();
  }

  Future<List<User>> getListUser() async {
    QuerySnapshot qShot = await userCollection.getDocuments();

    return qShot.documents
        .map((doc) => User(
              doc.data['name'],
              doc.data['wallet'],
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
