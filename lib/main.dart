import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(Begun());
}

class Begun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Begun',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SignInScreen())
      ],
);
  }
}