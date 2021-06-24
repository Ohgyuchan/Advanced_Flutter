import 'package:advanced_flutter/models/post_model.dart';
import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Comment {
  final Timestamp creationData ;
  final Timestamp updateData ;
  final String userId ;
  final String email ;
  final String productId ;
  final String content ;
  final String name ;
  final String imgA ;
  final String imgURL ;
  final int likes ;
  final DocumentSnapshot documentSnapshot;

  Comment({
    required this.creationData,
    required this.updateData,
    required this.userId,
    required this.email,
    required this.productId,
    required this.content,
    required this.name,
    required this.imgA,
    required this.imgURL,
    required this.likes,
    required this.documentSnapshot,
  });
}