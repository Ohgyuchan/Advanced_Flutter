import 'package:advanced_flutter/models/chat_model.dart';
import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildStream(context);
  }

  Widget _buildStream(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("chat")
          .where('myUid', isEqualTo: currentUser.uid)
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
          padding: EdgeInsets.all(16.0),

          itemCount: snapshot.data!.docs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 2.0 / 2.2, crossAxisCount: 3),
          itemBuilder: (context, index) {
            DocumentSnapshot data = snapshot.data!.docs[index];
            return ChatModel(
              yourUid: data['uid'],
              yourName: data['title'],
              lastMessage: data['lastMessage'],
              date: data['date'],
              imgUrl: data['imgUrl'],
              docId: data.id,
              documentSnapshot: data,
            );
          },
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
//   final List<ChatMessage> _messages = [];
//   final _textController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   bool _isComposing = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Flexible(
//             child: ListView.builder(
//               padding: EdgeInsets.all(8.0),
//               reverse: true,
//               itemBuilder: (_, int index) => _messages[index],
//               itemCount: _messages.length,
//             ),
//           ),
//           Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(color: Theme.of(context).cardColor),
//             child: _buildTextComposer(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextComposer() {
//     return IconTheme(
//       data: IconThemeData(color: Theme.of(context).accentColor),
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: [
//             Flexible(
//               child: TextField(
//                 controller: _textController,
//                 onChanged: (String text) {
//                   setState(() {
//                     _isComposing = text.isNotEmpty;
//                   });
//                 },
//                 onSubmitted: _isComposing ? _handleSubmitted : null,
//                 decoration:
//                 InputDecoration.collapsed(hintText: 'Send a message'),
//                 focusNode: _focusNode,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 4.0),
//               child: IconButton(
//                 icon: const Icon(Icons.send),
//                 onPressed: _isComposing
//                     ? () => _handleSubmitted(_textController.text)
//                     : null,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _handleSubmitted(String text) {
//     _textController.clear();
//     setState(() {
//       _isComposing = false;
//     });
//     var message = ChatMessage(
//       text: text,
//       animationController: AnimationController(
//         duration: const Duration(milliseconds: 5),
//         vsync: this,
//       ),
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//     _focusNode.requestFocus();
//     message.animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     for (var message in _messages) {
//       message.animationController.dispose();
//     }
//     super.dispose();
//   }
// }
//
// class ChatMessage extends StatelessWidget {
//   ChatMessage({required this.text, required this.animationController});
//   final String text;
//   final AnimationController animationController;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizeTransition(
//       sizeFactor:
//       CurvedAnimation(parent: animationController, curve: Curves.easeOut),
//       axisAlignment: 0.0,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(top: 5.0),
//                     child: Text(text),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }