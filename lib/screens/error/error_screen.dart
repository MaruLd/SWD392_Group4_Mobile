import 'package:flutter/material.dart';

import '../enums.dart';
import '../error/components/body.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';

void main() {
  runApp(ErrorScreen());
}

class ErrorScreen extends StatelessWidget{
  static String routeName ="/error";
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Error() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}
class Error extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF11CDEF),
          /*backgroundColor: Colors.transparent,
          elevation: 0.0,*/
          title:  const Center(
            child: Text(
                'Evsmart', style: TextStyle(color: Colors.white),
            ),
          )
      ),
      body: Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home,),
    );
  }
}