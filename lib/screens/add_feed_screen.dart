import 'package:advanced_flutter/utils/firebase.dart';
import 'package:flutter/material.dart';

class AddFeedScreen extends StatefulWidget {
  @override
  _AddFeedScreenState createState() => _AddFeedScreenState();
}

class _AddFeedScreenState extends State<AddFeedScreen> {
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
              'Create HR Relocation',
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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
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
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                child: Text('Post'),
                onPressed: () {
                  addFeed(descriptionController.text);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
