import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
        child: Column(
          children: [
            Image.asset("assets/images/404.png"),
            Center(
            child: Text(
              'Something went wrong !!!!', style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          ],

    ));
  }
}