import 'package:advanced_flutter/Management/FeedController.dart';
import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:advanced_flutter/models/feed_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            : ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(16.0),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot data = snapshot.data!.docs[index];
            return FeedModel(
              isProfile: false,
              uid: data['uid'],
              name: data['name'],
              profileImageUrl: data['profileImageUrl'],
              imageUrl: data['imageUrl'],
              createdTime: data['createdTime'],
              description: data['description'],
              comments: data['comments'],
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
