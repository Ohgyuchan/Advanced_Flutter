// import 'package:advanced_flutter/models/feed_model.dart';
// import 'package:advanced_flutter/repositories/feed_repository.dart';
// import 'package:advanced_flutter/screens/screen_status.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// // class FeedViewModel extends GetxController {
// //         RxList<FeedModel> feeds = <FeedModel>[].obs;
// //         void addFeed(FeedModel feed){
// //           feeds.add(feed);
// //         }
// // }
// //
// // Container(
// //       child: Obx(()=> Text(feed_view_model.feeds[0].content))
// // )
//
//
// class FeedViewModel extends GetxController
//     with ScreenStatus, GetDataWithScreen {
//   FeedRepository _feedRepository;
//   RxList<FeedModel> feeds = <FeedModel>[].obs;
//
//   FeedViewModel({required FeedRepository feedRepository}) {
//     _feedRepository = feedRepository;
//   }
//
//   void getNoticeList() async {
//     //데이터 호출 시작하면 Loading Widget
//     //데이터 가져올때 Error면 Error Widget
//     var result = await getDataWithScreenStatus(_feedRepository.getFeedList);
//
//     if (result == null) {
//       return;
//     }
//
//     feeds.clear();
//     feeds.addAll(result);
//     //데이터 비어있으면 Empty Widget
//     //데이터가 비어있찌 않으면 Loaded Widget (실제 보여주고 싶은 화면)
//     checkEmptyWithScreenStatus(result);
//   }
// }