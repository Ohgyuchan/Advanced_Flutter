import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return InkWell(
        child:
        Card(
          elevation: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              width: double.infinity,
              height: 380.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
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

                          subtitle: Text('${DateFormat('yyyy/MM/dd').format(widget.createdTime.toDate()).toString()}'),
                          trailing: IconButton(
                            icon: Icon(Icons.more_horiz),
                            color: Colors.black,
                            onPressed: () => print('More'),
                          ),
                        ),
                        InkWell(
                          onDoubleTap: () => print('Like post'),
                          onTap: () =>
                              Navigator.push(context, MaterialPageRoute(builder: (_) => ViewPostScreen(feedModel: widget))),
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: NetworkImage(widget.imageUrl),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.description,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.favorite_border),
                                        iconSize: 30.0,
                                        onPressed: () => print('Like post'),
                                      ),
                                      Text(
                                        widget.likes.toString(),
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20.0),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(Icons.chat),
                                          iconSize: 30.0,
                                          onPressed: () =>
                                              Navigator.push(context, MaterialPageRoute(builder: (_) => ViewPostScreen(feedModel: widget)))
                                      ),
                                      Text(
                                        widget.comments.toString(),
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.bookmark_border),
                                iconSize: 30.0,
                                onPressed: () => print('Save post'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
        });
  }

  Widget _buildProfileScreen() {
    return InkWell(
        child: SizedBox(
          child: Card(
            elevation: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              child: Hero(
                tag: 'img-${widget.docId}',
                child: Image.network(
                  widget.imageUrl,
                  height: 200,
                  fit: BoxFit.fitWidth,
                ),
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