import 'package:flutter/material.dart';
import 'package:evsmart/screens/login/components/body.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //use MaterialApp() widget like this
      appBar: AppBar(
          title: Center(
        child: Text(
          "",
          style: TextStyle(color: Color(0xFF8D8D8D)),
        ),
      ),
      ),
      body: Body(),
    );
  }
}
