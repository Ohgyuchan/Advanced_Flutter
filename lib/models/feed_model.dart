import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedModel extends StatefulWidget {
  late final bool isProfile;
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
    required this.isProfile,
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

  @override
  _FeedModelState createState() => _FeedModelState();
}

class _FeedModelState extends State<FeedModel> {
  @override
  Widget build(BuildContext context) {
    return widget.isProfile ? _buildProfileScreen() : _buildFeedScreen();
  }

  Widget _buildFeedScreen() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
            child: SizedBox(
              child: Card(
                elevation: 0,
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
                          height:
                              8.0 / MediaQuery.of(context).size.height * 0.2),
                      _buildCardRow(context, '', widget.createdTime.toString()),
                      SizedBox(
                          height:
                              4.0 / MediaQuery.of(context).size.height * 0.2),
                      _buildCardRow(context, '', widget.description),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ViewPostScreen(feedModel: widget),
                ),
              );
              print('clicked');
            }),
        Divider(
          color: Colors.black54,
        )
      ],
    );
  }

  Widget _buildProfileScreen() {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
                child: SizedBox(
                  child: Card(
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ViewPostScreen(feedModel: widget),
                    ),
                  );
                  print('clicked');
                }),
          ],
        ),
        Divider(
          height: 10,
          color: Colors.black54,
        )
      ],
    );
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
