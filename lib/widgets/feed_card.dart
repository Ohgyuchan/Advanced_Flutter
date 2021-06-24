// import 'package:advanced_flutter/models/feed_model.dart';
// import 'package:advanced_flutter/repositories/feed_repository.dart';
// import 'package:advanced_flutter/screens/view_post_screen.dart';
// import 'package:flutter/material.dart';
//
// class FeedCard extends StatelessWidget {
//   final String uid;
//   final FeedModel feed;
//
//   const FeedCard({Key? key, required this.uid, required this.feed}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//       child: Container(
//         width: double.infinity,
//         height: 380.0,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(25.0),
//         ),
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0),
//               child: Column(
//                 children: <Widget>[
//                   ListTile(
//                     leading: Container(
//                       width: 50.0,
//                       height: 50.0,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: CircleAvatar(
//                         child: ClipOval(
//                           child: Image(
//                             height: 50.0,
//                             width: 50.0,
//                             image: AssetImage(feed.imgA),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       feed.name,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     subtitle: Text(feed.time),
//                     trailing: IconButton(
//                       icon: Icon(Icons.more_horiz),
//                       color: Colors.black,
//                       onPressed: () => print('More'),
//                     ),
//                   ),
//                   InkWell(
//                     onDoubleTap: () => print('Like post'),
//                     //onTap: () =>
//                       //  Navigator.push(context, MaterialPageRoute(builder: (_) => ViewPostScreen(document: document,))),
//                     child: Container(
//                       margin: EdgeInsets.all(10.0),
//                       width: double.infinity,
//                       height: 200.0,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25.0),
//                         image: DecorationImage(
//                           image: AssetImage(feed.imgURL),
//                           fit: BoxFit.fitWidth,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Row(
//                               children: <Widget>[
//                                 IconButton(
//                                   icon: Icon(Icons.favorite_border),
//                                   iconSize: 30.0,
//                                   onPressed: () => print('Like post'),
//                                 ),
//                                 Text(
//                                   feed.like.toString(),
//                                   style: TextStyle(
//                                     fontSize: 14.0,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(width: 20.0),
//                             Row(
//                               children: <Widget>[
//                                 // IconButton(
//                                 //   icon: Icon(Icons.chat),
//                                 //   iconSize: 30.0,
//                                 //   onPressed: () =>
//                                 //       Navigator.push(context, MaterialPageRoute(builder: (_) => ViewPostScreen(document: document,))),
//                                 // ),
//                                 Text(
//                                   feed.comments.toString(),
//                                   style: TextStyle(
//                                     fontSize: 14.0,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.bookmark_border),
//                           iconSize: 30.0,
//                           onPressed: () => print('Save post'),
//                         ),
//                       ],
//                     ),
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