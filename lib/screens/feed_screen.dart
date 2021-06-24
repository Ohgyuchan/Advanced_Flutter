import 'package:advanced_flutter/models/feed_model.dart';
import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildStream();
  }

  Widget _buildStream() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("post")
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
          padding: EdgeInsets.all(16.0),

          itemCount: snapshot.data!.docs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 2.0 / 2.2, crossAxisCount: 3),
          itemBuilder: (context, index) {
            DocumentSnapshot data = snapshot.data!.docs[index];
            return FeedModel(
              uid: data['uid'],
              name: data['name'],
              imgURL: data['imgURL'],
              createdTime: data['createdTime'],
              description: data['description'],
              comments: data['lastMessage'],
              like: data['like'],
              likes: data['likes'],
              docId: data.id,
              documentSnapshot: data,
            );
          },
        );
      },
    );
  }
}
