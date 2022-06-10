import 'package:evsmart/screens/enums.dart';
import 'package:flutter/material.dart';

import '../home/components/body.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';


class FavoriteScreen extends StatelessWidget{
  static String routeName ="/favorite";
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Favorite() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}
class Favorite extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF11CDEF),
        /* backgroundColor: Colors.transparent,
          elevation: 0.0,*/
          title:  Center(
            child: Text(
                'Favorite', style: TextStyle(color: Colors.white)
            ),
          )
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favorite),
    );
  }
}