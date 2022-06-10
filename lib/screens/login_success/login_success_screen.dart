import 'package:flutter/material.dart';
class LoginSuccessScreen extends StatelessWidget{
  static String routeName ="/login_success";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
      title: Center(
        child: Text(
          "",
          style: TextStyle(color: Color(0xFF8D8D8D)),
        ),
      ),
    ),);
  }
}