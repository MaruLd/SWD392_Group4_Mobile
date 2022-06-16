import '../../mainComponent/custom_bottom_nav_bar.dart';
import '../detail//components/body.dart';
import 'package:flutter/material.dart';
import '../enums.dart';

class EventDetail extends StatelessWidget{
  static String routeName ="/eventdetail";
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.eventdetail,),
      ),
    );
  }
}
