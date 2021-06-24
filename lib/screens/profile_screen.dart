import 'package:advanced_flutter/models/feed_model.dart';
import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          currentUser.displayName.toString(),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CircleAvatar(
          child: ClipOval(
            child: Image(
              image: NetworkImage(currentUser.photoURL.toString()),
            ),
          ),
        ),
      ),
      body: _buildMyProfileStream(),
    );
  }

  Widget _buildMyProfileStream() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("post")
          .where('uid', isEqualTo: '${currentUser.uid}')
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: snapshot.data!.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 18.0 / 18.0, crossAxisCount: 3),
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];
                  return FeedModel(
                    isProfile: true,
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
