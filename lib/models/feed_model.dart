import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedModel extends StatefulWidget {
  late final String uid;
  late final String name;
  late final String profileImageUrl;
  late final String imageUrl;
  late final Timestamp createdTime;
  late final String description;
  late final int comments;
  late final String like;
  late final int likes;
  late final String docId;
  late final DocumentSnapshot documentSnapshot;

  FeedModel({
    required this.uid,
    required this.name,
    required this.profileImageUrl,
    required this.imageUrl,
    required this.createdTime,
    required this.description,
    required this.comments,
    required this.like,
    required this.likes,
    required this.docId,
    required this.documentSnapshot,
  });

<<<<<<< HEAD
  FeedModel copyWith({
    required String name,
    required String imgA,
    required String imgURL,
    required String time,
    required int comments,
    required String like,
    required int likes,
    required DocumentSnapshot documentSnapshot,
}) {
    return FeedModel(
      name: name,
      imgA: imgA,
      imgURL: imgURL,
      time: time,
      comments: comments,
      like: like,
      likes: likes,
      documentSnapshot: documentSnapshot);
}

  factory FeedModel.fromDs(dynamic data) {
    return FeedModel(
    name: data["name"],
    imgA: data["imgA"],
    imgURL: data["imgURL"],
    time: data["time"],
    comments: data["comments"],
    like: data["like"],
    likes: data["likes"],
    documentSnapshot: data,
    );}
  Map<String, dynamic> toMap(){
    return{
      'name': name,
    'imgA': imgA,
    'imgURL': imgURL,
    'time': time,
    'comments': comments,
    'like': like,
    'likes': likes,
    'documentSnapshot': documentSnapshot,
    };
  }
=======
  @override
  _FeedModelState createState() => _FeedModelState();
>>>>>>> sun
}

class _FeedModelState extends State<FeedModel> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: SizedBox(
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                  _buildCardRow(context, '', widget.name),
                  SizedBox(
                      height: 8.0 / MediaQuery.of(context).size.height * 0.2),
                  _buildCardRow(context, '', widget.createdTime.toString()),
                  SizedBox(
                      height: 4.0 / MediaQuery.of(context).size.height * 0.2),
                  _buildCardRow(context, '', widget.description),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  ViewPostScreen(feedModel: widget),
            ),
          );
          print('clicked');
        });
  }

  Flex _buildCardRow(BuildContext context, String label, String value) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.left,
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.right,
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
