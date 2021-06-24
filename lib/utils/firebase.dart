import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference post = FirebaseFirestore.instance.collection('post');

Future<void> addFeed(
  String description, String imageURL
) {
  return post
      .add({
  'uid': currentUser.uid,
  'name': currentUser.displayName,
  'profileImageUrl': currentUser.photoURL,
  'imageUrl': imageURL,
  'createdTime': new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  'description': description,
  'comments': 0,
  'like': '0',
  'likes': 0,
  })
      .then((value) async{
        post.doc(value.id).set({
          'docId': value.id,
          'filePath' : value.id + '.jpg',
        }, SetOptions(merge: true));
  });
}

Future<void> updatePosted(String uid, bool posted) async {
  await FirebaseFirestore.instance
      .collection("approved")
      .doc(uid)
      .update({"posted": posted});
}

Future<void> addComment(String docId, String comment) async {
  post.doc(docId).collection('comments').add({
    'name': currentUser.displayName,
    'profileImageUrl': currentUser.photoURL,
    'comment': comment,
    'creationTime': DateTime.now(),
  });
}

Future<void> increaseComments(DocumentSnapshot data, String docId) {
  return post
      .doc(docId)
      .update({
        'comments': data['comments'] + 1,
      })
      .then((value) => print("Product Edited"))
      .catchError((error) => print("Failed to edit product: $error"));
}

Future<void> decreaseComments(DocumentSnapshot data, String docId) {
  return post
      .doc(docId)
      .update({
        'comments': data['comments'] - 1,
      })
      .then((value) => print("Product Edited"))
      .catchError((error) => print("Failed to edit product: $error"));
}

Future<void> increaseLike(
    DocumentSnapshot data, String docId, String uid) async {
  return post
      .doc(docId)
      .update({
        'likes': data['like'].length,
      })
      .then((value) => print("Product Edited"))
      .catchError((error) => print("Failed to edit product: $error"));
}
