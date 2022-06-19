import 'package:evsmart/screens/enums.dart';
import 'package:flutter/material.dart';
import '../myticket//components/body.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';


class MyTicketScreen extends StatelessWidget{
  static String routeName ="/mytickets";
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        debugShowCheckedModeBanner: false,
        home: MyTicket() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}
class MyTicket extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF11CDEF),
          /* backgroundColor: Colors.transparent,
          elevation: 0.0,*/
          title:  Center(
            child: Text(
                'My ticket', style: TextStyle(color: Colors.white)
            ),
          )
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.mytickets),
    );
  }
}