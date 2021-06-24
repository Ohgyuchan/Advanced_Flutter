import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hashtagable/hashtagable.dart';

class ViewPostScreen extends StatefulWidget {
  DocumentSnapshot document;
  ViewPostScreen({required this.document});

  @override
  _ViewPostScreenState createState() => _ViewPostScreenState(document: document);
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  DocumentSnapshot document;
  _ViewPostScreenState({required this.document});

  final _formKey = GlobalKey<FormState>(debugLabel: '_CommentState');
  final _controller = TextEditingController();

  Future<void> addQuestion(String content) async {
    FirebaseFirestore question = FirebaseFirestore.instance;
    final future = question.collection('post').doc(document.id).collection('comments').add({
      'creationDate': FieldValue.serverTimestamp(),
      'updateDate': FieldValue.serverTimestamp(),
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'email': FirebaseAuth.instance.currentUser!.email,
      'productId': document.id,
      'content': content,
      'name' : document['name'],
      'imgA' : document['imgA'],
      'imgURL' : document['imgURL'],
      'likes' : document['like'].length,
    });
  }

  CollectionReference post = FirebaseFirestore.instance.collection('post');
  Future<void> addCount() {
    return post
        .doc(document.id)
        .set({
      'name' : document['name'],
      'imgA' : document['imgA'],
      'imgURL' : document['imgURL'],
      'time' : document['time'],
      'comments': document['comments'] + 1,
      'likes' : document['like'].length,
    })
        .then((value) => print("Product Edited"))
        .catchError((error) => print("Failed to edit product: $error"));
  }

  CollectionReference post2 = FirebaseFirestore.instance.collection('post');
  Future<void> decreaseCount() {
    return post
        .doc(document.id)
        .set({
      'name' : document['name'],
      'imgA' : document['imgA'],
      'imgURL' : document['imgURL'],
      'time' : document['time'],
      'comments': document['comments'] - 1,
      'likes' : document['like'].length,
    })
        .then((value) => print("Product Edited"))
        .catchError((error) => print("Failed to edit product: $error"));
  }



  CollectionReference post3 = FirebaseFirestore.instance.collection('post');
  Future<void> likeIt() async {
    return post3
        .doc(document.id)
        .set({
      'like' : FieldValue.arrayUnion([document['name']]),
      'name' : document['name'],
      'imgA' : document['imgA'],
      'imgURL' : document['imgURL'],
      'time' : document['time'],
      'comments': document['comments'],
      'likes' : document['like'].length,
    })
        .then((value) => print("Product Edited"))
        .catchError((error) => print("Failed to edit product: $error"));
  }

  @override
  Widget build(BuildContext context) {
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
                                        image: AssetImage(
                                            document['imgA']),
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
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            HashTagText(
                            text: "#Advenced_Flutter #Too_Easy",
                            decoratedStyle: TextStyle(fontSize: 14, color: Colors.blue),
                            basicStyle: TextStyle(fontSize: 14, color: Colors.black),
                            onTap: (text){
                              print(text);
                            },
                          ),
                            HashTagTextField(
                              basicStyle: TextStyle(fontSize: 15, color: Colors.black),
                              decoratedStyle: TextStyle(fontSize: 15, color: Colors.blue),
                              keyboardType: TextInputType.multiline,

                              /// Called when detection (word starts with #, or # and @) is being typed
                              onDetectionTyped: (text) {
                                print(text);
                              },

                              /// Called when detection is fully typed
                              onDetectionFinished: () {
                                print("detection finished");
                              },
                            ),
                        ],
                        ),
                        InkWell(
                          onDoubleTap: () => print('Like post'),
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 400.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),

                              image: DecorationImage(
                                image: AssetImage(document['imgURL']),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Padding( // TO DO //
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
                                        onPressed: () {
                                          likeIt() ;
                                        },
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
                                        onPressed: () {
                                          print('Chat');
                                        },
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
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              height: 600.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 500,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('post')
                            .doc(document.id)
                            .collection('comments')
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
                                    padding: EdgeInsets.all(10.0),
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
                                              image: AssetImage(document['imgA']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        document['content'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle:Row(
                                        children: [
                                          Text(
                                            document['name'],
                                          ),
                                        ],
                                      ),
                                      trailing: IconButton(
                                          icon: Icon(
                                            Icons.delete_outline,
                                          ),
                                          color: Colors.grey,
                                          onPressed: () {
                                            FirebaseFirestore.instance.collection('post').doc(document['productId']).collection('comments').doc(document.id).delete();
                                            decreaseCount();
                                          }
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                          }
                        }
                    )
                  ),
                ],
              ),
            )
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
                          image: AssetImage(widget.document['imgA']),
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
                        final String Comment = _controller.text;
                        if (Comment == "") {
                          print('다시 입력해주세요');
                        }
                        else if (_formKey.currentState!.validate()) {
                          await addQuestion(_controller.text);
                          addCount();
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