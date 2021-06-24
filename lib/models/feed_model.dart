import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FeedModel {

  late final String name ;
  late final String imgA ;
  late final String imgURL ;
  late final String time ;
  late final int comments ;
  late final String like ;
  late final int likes ;
  late final DocumentSnapshot documentSnapshot;


  FeedModel({
    required this.name,
    required this.imgA,
    required this.imgURL,
    required this.time,
    required this.comments,
    required this.like,
    required this.likes,
    required this.documentSnapshot,
  });

  FeedModel copyWith({
    required String name,
    required String imgA,
    required String imgURL,
    required String time,
    required int comments,
    required String like,
    required int likes,
    required DocumentSnapshot documentSnapshot,
}) {
    return FeedModel(
      name: name,
      imgA: imgA,
      imgURL: imgURL,
      time: time,
      comments: comments,
      like: like,
      likes: likes,
      documentSnapshot: documentSnapshot);
}

  factory FeedModel.fromDs(dynamic data) {
    return FeedModel(
    name: data["name"],
    imgA: data["imgA"],
    imgURL: data["imgURL"],
    time: data["time"],
    comments: data["comments"],
    like: data["like"],
    likes: data["likes"],
    documentSnapshot: data,
    );}
  Map<String, dynamic> toMap(){
    return{
      'name': name,
    'imgA': imgA,
    'imgURL': imgURL,
    'time': time,
    'comments': comments,
    'like': like,
    'likes': likes,
    'documentSnapshot': documentSnapshot,
    };
  }
}


