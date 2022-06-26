import 'package:flutter/material.dart';
import '../constraint.dart';
import '../enums.dart';
import '../home/components/body.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  var isLoaded = false;

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
          //backgroundColor: const Color(0xFF11CDEF),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
              'Evsmart', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)
          ),
        ),
        body: Body(),
        bottomNavigationBar: const CustomBottomNavBar(
          selectedMenu: MenuState.home,
        ),
      ),
    );
  }
}
