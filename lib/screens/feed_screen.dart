import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';`
import 'package:advanced_flutter/screens/view_post_screen.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEDF0F6),
        body: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Instagram',
                    style: TextStyle(
                      fontFamily: 'Billabong',
                      fontSize: 32.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.live_tv),
                        iconSize: 30.0,
                        onPressed: () {

                        },
                      ),
                      SizedBox(width: 16.0),
                      Container(
                        width: 35.0,
                        child: IconButton(
                          icon: Icon(Icons.send),
                          iconSize: 30.0,
                          onPressed: () => print('Direct Messages'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 500,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('post')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) return Text("Error: ${snapshot.error}");
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Text("Loading...");
                    default:
                      return ListView(
                        scrollDirection: Axis.vertical,
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          return new Padding(
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
                                                  image: AssetImage(document['imgA']),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            document['name'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(document['time']),
                                          trailing: IconButton(
                                            icon: Icon(Icons.more_horiz),
                                            color: Colors.black,
                                            onPressed: () => print('More'),
                                          ),
                                        ),
                                        InkWell(
                                          onDoubleTap: () => print('Like post'),
                                          onTap: () =>
                                              Navigator.push(context, MaterialPageRoute(builder: (_) => ViewPostScreen(document: document))),
                                          child: Container(
                                            margin: EdgeInsets.all(10.0),
                                            width: double.infinity,
                                            height: 200.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25.0),
                                              image: DecorationImage(
                                                image: AssetImage(document['imgURL']),
                                                fit: BoxFit.fitWidth,
                                              ),
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
                                                        document['likes'].toString(),
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
                                                            Navigator.push(context, MaterialPageRoute(builder: (_) => ViewPostScreen(document: document))),
                                                      ),
                                                      Text(
                                                        document['comments'].toString(),
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
                          );
                        }).toList(),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}