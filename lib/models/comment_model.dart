import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommentModel extends StatefulWidget {
  String name;
  String profileImageUrl;
  String comment;
  Timestamp creationTime;
  String docId;
  DocumentSnapshot documentSnapshot;

  CommentModel({
    required this.name,
    required this.profileImageUrl,
    required this.comment,
    required this.creationTime,
    required this.docId,
    required this.documentSnapshot,
  });

  @override
  _CommentModelState createState() => _CommentModelState();
}

class _CommentModelState extends State<CommentModel> {
  @override
  Widget build(BuildContext context) {
    return _buildComment();
  }

  Widget _buildComment() {
    return ListTile(
      leading: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          child: ClipOval(
            child: Image(
              height: 50.0,
              width: 50.0,
              image: NetworkImage(widget.profileImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        widget.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(widget.comment),
      trailing: IconButton(
        icon: Icon(Icons.more_horiz),
        color: Colors.black,
        onPressed: () => print('More'),
      ),
    );
  }
}
