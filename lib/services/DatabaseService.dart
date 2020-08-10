import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference expenseCollection =
      Firestore.instance.collection('expense');

  Future<void> updateUserData(
      String title, int price, String description) async {
    return await expenseCollection.document(uid).setData({
      'title': title,
      'price': price,
      'description': description,
    });
  }
}
