// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AuthController extends GetxController {
//   final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
//   static AuthController instance = Get.find();
//
//
//   late TextEditingController emailController, passwordController;
//   var user = '';
//   var uid = '';
//   @override
//   void onInit() {
//     super.onInit();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//   }
//
//   String? validateEmail(String value) {
//     if (!GetUtils.isEmail(value)) {
//       return "Provide valid Email";
//     }
//     return null;
//   }
//
//   String? validatePassword(String value) {
//     if (value.length < 6) {
//       return "Password must be of 6 characters";
//     }
//     return null;
//   }
//
//   void checkLogin() {
//     final isValid = loginFormKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     loginFormKey.currentState!.save();
//   }
// }