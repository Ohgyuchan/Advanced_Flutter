import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:advanced_flutter/utils/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hashtagable/widgets/hashtag_text_field.dart';
import 'package:image_picker/image_picker.dart';

Future<void> uploadFile(String _path, String filePath) async {
  File file = File(_path);

  await firebase_storage.FirebaseStorage.instance.ref(filePath).putFile(file);
}

class AddFeedScreen extends StatefulWidget {
  AddFeedScreen({
    required this.downloadImageURL,
  });

  final Future<String>? downloadImageURL;

  @override
  _AddFeedScreenState createState() => _AddFeedScreenState();
}

class _AddFeedScreenState extends State<AddFeedScreen> {
  late File _image = File("");
  final picker = ImagePicker();
  late String _path;
  String imageURL = "";
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  var user = FirebaseAuth.instance.currentUser;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _path = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
    firebase_storage.Reference storageReference =
        _firebaseStorage.ref().child("feed/${DateTime.now()}");
    // 사진을 업로드 할 경와 파일명을 정의

    firebase_storage.UploadTask storageUploadTask =
        storageReference.putFile(_image);
    // 파일 업로드

    await storageUploadTask.whenComplete(() => null);
    // 파일 업로드 될 때까지 대기

    String downloadURL = await storageReference.getDownloadURL();
    // 업로드 한 사진의 URL 획득

    setState(() {
      imageURL = downloadURL;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'Add Feed',
          style: TextStyle(color: Colors.black),
        )),
        leading: TextButton(
          child: Text('Cancel'),
          style: TextButton.styleFrom(
              primary: Colors.black, textStyle: TextStyle(fontSize: 12)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (descriptionController.text != null)
                addFeed(descriptionController.text, imageURL);
              Navigator.of(context).pop();
            },
            child: Text(
              "저장",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // ignore: unnecessary_null_comparison
            _image == null
                ? FutureBuilder<String>(
                    future: widget.downloadImageURL,
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return AspectRatio(
                            aspectRatio: 20 / 11,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        case ConnectionState.done:
                          return AspectRatio(
                            aspectRatio: 20 / 11,
                            child: Image.network(
                              snapshot.data.toString(),
                            ),
                          );
                      }
                    },
                  )
                : AspectRatio(
                    aspectRatio: 20 / 11,
                    child: Image.file(
                      _image,
                      fit: BoxFit.cover,
                    ),
                  ),
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                ),
                onPressed: () {
                  getImage();
                },
              ),
            ),
            SizedBox(height: 15.0),
            Container(),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: HashTagTextField(
                decoration: InputDecoration(
                    focusedBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.blue,
                            width: 2,
                            style: BorderStyle.solid)),
                    labelText: "Description",
                    fillColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    )),
                controller: descriptionController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
