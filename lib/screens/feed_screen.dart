import 'package:advanced_flutter/Management/AuthController.dart';
import 'package:advanced_flutter/Management/FeedController.dart';
import 'package:advanced_flutter/Management/GetxController.dart';
import 'package:advanced_flutter/Management/UserController.dart';
import 'package:advanced_flutter/repositories/feed_repository.dart';
import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:advanced_flutter/view_model/feed_view_model.dart';
import 'package:advanced_flutter/widgets/feed_card.dart';
import 'package:advanced_flutter/widgets/screen_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:advanced_flutter/models/post_model.dart';
import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:get/get.dart';

class FeedScreen extends GetWidget<AuthController> {

  final TextEditingController _feedController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _feedController,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_feedController.text != "") {
                        FeedRepository()
                            .addFeed(_feedController.text, currentUser.uid);
                        _feedController.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetX<FeedController>(
            init: Get.put<FeedController>(FeedController()),
            builder: (FeedController feedController) {
              if (feedController != null && feedController.feeds != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: feedController.feeds.length,
                    itemBuilder: (_, index) {
                      return FeedCard(
                          uid: currentUser.uid,
                          feed: feedController.feeds[index]);
                    },
                  ),
                );
              } else {
                return Text("loading...");
              }
            },
          )
        ],
      ),
    );
  }

}
      //   children: <Widget>[
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           Text(
      //             'Instagram',
      //             style: TextStyle(
      //               fontFamily: 'Billabong',
      //               fontSize: 32.0,
      //             ),
      //           ),
      //           Row(
      //             children: <Widget>[
      //               IconButton(
      //                 icon: Icon(Icons.live_tv),
      //                 iconSize: 30.0,
      //                 onPressed: () => print('IGTV'),
      //               ),
      //               SizedBox(width: 16.0),
      //               Container(
      //                 width: 35.0,
      //                 child: IconButton(
      //                   icon: Icon(Icons.send),
      //                   iconSize: 30.0,
      //                   onPressed: () => print('Direct Messages'),
      //                 ),
      //               )
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //     Container(
      //       width: double.infinity,
      //       height: 100.0,
      //       child: ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: stories.length + 1,
      //         itemBuilder: (BuildContext context, int index) {
      //           if (index == 0) {
      //             return SizedBox(width: 10.0);
      //           }
      //           return Container(
      //             margin: EdgeInsets.all(10.0),
      //             width: 60.0,
      //             height: 60.0,
      //             decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //
      //             ),
      //             child: CircleAvatar(
      //               child: ClipOval(
      //                 child: Image(
      //                   height: 60.0,
      //                   width: 60.0,
      //                   image: AssetImage(stories[index - 1]),
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //     _buildPost(0),
      //     _buildPost(1),
      //   ],
      // ),
