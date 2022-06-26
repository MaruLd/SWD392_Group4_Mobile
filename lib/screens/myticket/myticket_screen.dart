import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:flutter/material.dart';
import '../myticket//components/body.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';

class MyTicketScreen extends StatelessWidget {
  const MyTicketScreen({Key? key}) : super(key: key);
  static String routeName ="/mytickets";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon:Icon(
                    Icons.search, color: kPrimaryColor,
                  ),
            )
          ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: kPrimaryColor,),
            ),

            //backgroundColor: const Color(0xFF11CDEF),
             backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
                  'My ticket', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)
              ),
          centerTitle: true,
        ),
        body: Body(),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.mytickets),
      ),
    );
  }
}