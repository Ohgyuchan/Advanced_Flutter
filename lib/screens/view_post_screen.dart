import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:advanced_flutter/models/feed_model.dart';
import 'package:advanced_flutter/utils/firebase.dart';
import 'package:flutter/material.dart';

class ViewPostScreen extends StatefulWidget {
  const ViewPostScreen({Key? key, required FeedModel feedModel})
      : _feedModel = feedModel,
        super(key: key);

  final FeedModel _feedModel;

  @override
  _ViewPostScreenState createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  late FeedModel _feedModel;

  @override
  void initState() {
    _feedModel = widget._feedModel;

    super.initState();
  }

  final _formKey = GlobalKey<FormState>(debugLabel: '_CommentState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isLiked = false;
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40.0),
              width: double.infinity,
              height: 600.0,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              iconSize: 30.0,
                              color: Colors.black,
                              onPressed: () => Navigator.pop(context),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ListTile(
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
                                        image: NetworkImage(_feedModel.profileImageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  _feedModel.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle:
                                    Text(_feedModel.createdTime.toString()),
                                trailing: IconButton(
                                  icon: Icon(Icons.more_horiz),
                                  color: Colors.black,
                                  onPressed: () => print('More'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onDoubleTap: () {
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 400.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage(_feedModel.imageUrl),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          // TO DO //
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(_isLiked == false ? Icons.favorite_border : Icons.favorite),
                                        iconSize: 30.0,
                                        onPressed: () {
                                          increaseLike(
                                              _feedModel.documentSnapshot,
                                              _feedModel.docId,
                                              _feedModel.uid);
                                        },
                                      ),
                                      Text(
                                        _feedModel.likes.toString(),
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
                                        onPressed: () {
                                          print('Chat');
                                        },
                                      ),
                                      Text(
                                        _feedModel.comments.toString(),
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
            SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                  hintText: 'Add a comment',
                  prefixIcon: Container(
                    margin: EdgeInsets.all(4.0),
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          height: 48.0,
                          width: 48.0,
                          image: AssetImage(_feedModel.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.only(right: 4.0),
                    width: 70.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color(0xFF23B66F),
                      onPressed: () async {
                        final String comment = _controller.text;
                        if (_formKey.currentState!.validate()) {
                          addComment(_feedModel.docId, comment);
                          increaseComments(_feedModel.documentSnapshot, _feedModel.docId);
                          _controller.clear();
                        }
                      },
                      child: Icon(
                        Icons.send,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
