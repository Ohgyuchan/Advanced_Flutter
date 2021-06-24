import 'package:advanced_flutter/screens/chat_screen.dart';
import 'package:advanced_flutter/screens/feed_screen.dart';
import 'package:advanced_flutter/screens/profile_screen.dart';
import 'package:advanced_flutter/screens/shop_screen.dart';
import 'package:advanced_flutter/widgets/bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_feed_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              FeedScreen(),
              ShopScreen(),
              ChatScreen(),
              MyProfileScreen(),
            ],
          ),
          bottomNavigationBar: BottomBar(),
          floatingActionButton: FloatingActionButton(
            heroTag: "add_button",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddFeedScreen(),
                ),
              );
            },
            tooltip: "Add Feed",
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}