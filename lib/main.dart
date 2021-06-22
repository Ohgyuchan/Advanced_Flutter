import 'package:advanced_flutter/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(Begun());
}

class Begun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Begun',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff009EDB),
          textTheme:
          Theme.of(context).textTheme.apply(fontFamily: 'Open Sans')),
      home: SignInScreen(),
    );
  }
}
