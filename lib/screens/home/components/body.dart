import 'package:evsmart/screens/home/components/event_page_body.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          //header
          Container(),
          //body
          Expanded(child: SingleChildScrollView(
            child: EventPageBody(),
          ),
          ),
        ],
      )
    );
  }
}