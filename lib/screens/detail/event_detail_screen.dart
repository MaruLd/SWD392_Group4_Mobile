import 'package:get/get.dart';

import '../../mainComponent/custom_bottom_nav_bar.dart';
import '../constraint.dart';
import '../detail//components/body.dart';
import 'package:flutter/material.dart';
import '../enums.dart';
void main(){
  runApp(EventDetail());
}

class EventDetail extends StatelessWidget{
  static String routeName ="/detail";

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 5),
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: IconButton( icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                    onPressed: (){}
                ),
              ),
            )
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: kPrimaryColor,),
          ),
          title: Text(
            "",
            style:
            TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Body(),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.favorite),
      ),
    );
  }
}
