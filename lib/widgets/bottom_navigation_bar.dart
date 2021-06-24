import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        height: 50,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 15,
              ),
              child: Text(
                '피드',
                style: TextStyle(fontSize: 8),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size: 15,
              ),
              child: Text(
                '쇼핑',
                style: TextStyle(fontSize: 8),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.chat,
                size: 15,
              ),
              child: Text(
                '채팅',
                style: TextStyle(fontSize: 8),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.account_circle,
                size: 15,
              ),
              child: Text(
                '프로필',
                style: TextStyle(fontSize: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
