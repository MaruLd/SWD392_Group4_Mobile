import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
        child:  const Center(
      child: Text(
        'Something went wrong !!!!', style: TextStyle(color: Colors.red),
      ),
    ));
  }
}