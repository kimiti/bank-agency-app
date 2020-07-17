import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/src/models/posts.dart';

class DatabaseService {
  final String uid;
  final DateTime timestamp = DateTime.now();
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference postCollection =
      Firestore.instance.collection('posts');

  Future<void> updatePostData(
    double coop,
    double equity,
    double kcb,
    double family,
    double lukele,
    double airtelmoney,
    double token,
    double cash,
  ) async {
    return await postCollection.document(uid).setData({
      'coop': coop,
      'equity': equity,
      'kcb': kcb,
      'family': family,
      'lukele': lukele,
      'airtelmoney': airtelmoney,
      'token': token,
      'cash': cash,
      "timestamp": timestamp,
    });
  }

  // brew list from snapshot
  List<Posts> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      print(doc.data);
      return Posts(
        coop: doc.data['coop'],
        equity: doc.data['equity'],
        kcb: doc.data['kcb'],
        family: doc.data['family'],
        lukele: doc.data['lukele'],
        airtelmoney: doc.data['airtelmoney'],
        token: doc.data['token'],
        cash: doc.data['cash'],
        timestamp: doc.data['timestamp'],
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Posts>> get brews {
    return postCollection
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(_postListFromSnapshot);
  }
}
