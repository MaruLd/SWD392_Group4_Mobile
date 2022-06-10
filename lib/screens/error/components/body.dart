import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
        child:  Center(
      child: Text(
        'Something went wrong !!!!', style: TextStyle(color: Colors.red),
      ),
    ));
  }
}