import 'package:flutter/material.dart';
import '../error/components/body.dart';

class ErrorScreen extends StatelessWidget{
  static String routeName ="/error";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Body(),
    );
  }
}