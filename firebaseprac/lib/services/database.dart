import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection ref
  final CollectionReference highscoresCol = Firestore.instance.collection('highscores');
  // highscores collection -> username, score
  Future updateUserData(String _username, String _score) async {
    return await highscoresCol.document(uid).setData({
      'username': _username,
      'score': _score,
    });
  }
}