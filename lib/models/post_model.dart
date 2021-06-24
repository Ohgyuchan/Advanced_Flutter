import 'package:advanced_flutter/screens/view_post_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post {
  final String name ;
  final String imgA ;
  final String imgURL ;
  final String time ;
  final int comments ;
  final String like ;
  final int likes ;
  final DocumentSnapshot documentSnapshot;

  Post({
    required this.name,
    required this.imgA,
    required this.imgURL,
    required this.time,
    required this.comments,
    required this.like,
    required this.likes,
    required this.documentSnapshot,
  });
}