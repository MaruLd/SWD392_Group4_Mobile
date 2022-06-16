import 'package:flutter/material.dart';
import '../enums.dart';
import '../home/components/body.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';


class HomeScreen extends StatelessWidget{
  static String routeName ="/home";
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,),
      ),
    );
  }
}
