import 'package:advanced_flutter/models/feed_model.dart';
import 'package:advanced_flutter/repositories/feed_repository.dart';
import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  final String uid;
  final FeedModel feed;

  const FeedCard({Key? key, required this.uid, required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                feed.name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}