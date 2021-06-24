// import 'package:advanced_flutter/repositories/feed_repository.dart';
// import 'package:advanced_flutter/screens/sign_in_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:get/get.dart';
// import 'package:advanced_flutter/models/feed_model.dart';
// import 'AuthController.dart';
//
// class FeedController extends GetxController{
//
//   static FeedController instance = Get.find();
//   RxList<FeedModel> feedList = RxList<FeedModel>([]);
//   String collection = "feedLists";
//
//   // ignore: invalid_use_of_protected_member
//
//   List<FeedModel> get feeds => feedList.value;
//
//   //
//
//
//   @override
//   void onReady() {
//     super.onReady();
//     String uid = currentUser.uid;
//     feedList
//         .bindStream(FeedRepository().feedStream(uid)); //stream coming from firebase
//   }
//
//
//
// }
// // import 'package:advanced_flutter/repositories/feed_repository.dart';
// // import 'package:advanced_flutter/screens/sign_in_screen.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:get/get.dart';
// // import 'package:advanced_flutter/models/feed_model.dart';
// // import 'AuthController.dart';
// //
// // class FeedController extends GetxController{
// //   RxList<FeedModel> feedList = RxList<FeedModel>();
// //
// //   // ignore: invalid_use_of_protected_member
// //   List<FeedModel> get feeds => feedList.value;
// //
// //   //static FeedController instance = Get.find();
// //
// //
// //   @override
// //   void onInit() {
// //     String uid = currentUser.uid;
// //     feedList
// //         .bindStream(FeedRepository().feedStream(uid)); //stream coming from firebase
// //   }
// //
// //
// //
// // }
