import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference post = FirebaseFirestore.instance.collection('post');

Future<void> addComment(String docId, String ) {
  post.doc(docId).collection('comments').add({
    'title': position,
    'position': position,
    'level': level,
    'dutystation': dutystation,
    'division': division,
    'approval': false,
    'description': description,
    'uid': uid,
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

Future<void> increasLike(
    DocumentSnapshot data, String docId, String uid) async {
  return post
      .doc(docId)
      .update({
        'likes': data['like'].length,
      })
      .then((value) => print("Product Edited"))
      .catchError((error) => print("Failed to edit product: $error"));
}
