import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

import 'screens/sign_in_screen.dart';

void main() {
  runApp(Begun());
}

class Begun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Begun',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SignInScreen(),
    );
  }
}
