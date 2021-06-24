// import 'package:advanced_flutter/models/feed_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ChatRepository {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//
//   @override
//   Future<List<FeedModel>> getFeedList() async{
//     List<FeedModel> feeds = [];
//
//     try {
//       var feedCollection =
//       await _firebaseFirestore.collection('post').get();
//       for (var feed in feedCollection.docs){
//         feeds.add(FeedModel.fromDocumentSnapshot(feed));
//       }
//     } catch (e){
//       throw Exception('firebase error');
//     }
//     return feeds;
//
//   }
//
//   Stream<List<FeedModel>> feedStream(String uid) {
//     return FirebaseFirestore.instance
//         .collection("post")
//         .snapshots()
//         .map((QuerySnapshot query) {
//       List<FeedModel> retVal =  [];
//       query.docs.forEach((element) {
//         retVal.add(FeedModel.fromDocumentSnapshot(element));
//       });
//       return retVal;
//     });
//   }
//
//   Future<void> addFeed(String content, String uid) async {
//     try {
//       await _firebaseFirestore
//           .collection("post")
//           .add({
//         'dateCreated': Timestamp.now(),
//         'content': content,
//         'done': false,
//       });
//     } catch (e) {
//       print(e);
//       rethrow;
//     }
//   }
//
//   Future<void> updateFeed(bool newValue, String uid, String todoId) async {
//     try {
//       _firebaseFirestore
//           .collection("users")
//           .doc(uid)
//           .collection("todos")
//           .doc(todoId)
//           .update({"done": newValue});
//     } catch (e) {
//       print(e);
//       rethrow;
//     }
//   }
//
//
// }
//
