import 'package:advanced_flutter/models/post_model.dart';
import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Comment {
  String name;
  String profileImageUrl;
  String comment;

  Comment({
    required this.name,
    required this.profileImageUrl,
    required this.comment,
  });
}