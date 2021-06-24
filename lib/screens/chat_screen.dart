import 'package:advanced_flutter/models/chat_model.dart';
import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildStream(context);
  }

  Widget _buildStream(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("chat")
          .where('myUid', isEqualTo: currentUser.uid)
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
            return ChatModel(
              myUid: data['myUid'],
              myName: data['myName'],
              yourUid: data['yourUid'],
              yourName: data['yourName'],
              lastMessage: data['lastMessage'],
              date: data['date'],
              myImgUrl: data['myImgUrl'],
              yourImgUrl: data['yourImgUrl'],
              docId: data.id,
              documentSnapshot: data,
            );
          },
        );
      },
    );
  }
}