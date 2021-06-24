// import 'package:advanced_flutter/models/chat_model.dart';
// import 'package:advanced_flutter/repositories/feed_repository.dart';
// import 'package:advanced_flutter/screens/sign_in_screen.dart';
// import 'package:get/get.dart';
//
// class ChatController extends GetxController{
//   RxList<ChatModel> chatList = RxList<ChatModel>();
//
//   // ignore: invalid_use_of_protected_member
//   List<ChatModel> get chatLists => chatList.value;
//
//   //static FeedController instance = Get.find();
//
//
//   @override
//   void onInit() {
//     String uid = currentUser.uid;
//     chatList
//         .bindStream(FeedRepository().feedStream(uid)); //stream coming from firebase
//   }
//
//
//
// }