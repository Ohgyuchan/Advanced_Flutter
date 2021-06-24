import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatModel extends StatefulWidget {
  final String yourUid;
  final String yourName;
  final String lastMessage;
  final String date;
  final String imgUrl;
  final String docId;
  final DocumentSnapshot documentSnapshot;

  ChatModel({
    required this.yourUid,
    required this.yourName,
    required this.lastMessage,
    required this.date,
    required this.imgUrl,
    required this.docId,
    required this.documentSnapshot,
  });

  @override
  _ChatModelState createState() => _ChatModelState();
}

class _ChatModelState extends State<ChatModel> {

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
                  _buildCardRow(context, '', widget.yourName),
                  SizedBox(
                      height: 8.0 / MediaQuery.of(context).size.height * 0.2),
                  _buildCardRow(context, '', widget.date),
                  SizedBox(
                      height: 4.0 / MediaQuery.of(context).size.height * 0.2),
                  _buildCardRow(context, '', widget.lastMessage),
                ],
              ),
            ),
          ),
        ),
        onTap: () {});
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

  // static Route<Object?> _dialogBuilder(
  //     BuildContext context, Object? arguments) {
  //   return DialogRoute<void>(
  //     context: context,
  //     builder: (BuildContext context) => const AlertDialog(
  //       title: Text('This post has not yet been approved!',
  //           style:
  //               TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
  //       backgroundColor: Colors.grey,
  //     ),
  //   );
  // }
}
