import 'package:flutter/material.dart';
import '../enums.dart';
import '../search/components/body.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //use MaterialApp() widget like this
        debugShowCheckedModeBanner: false,
        home: Search() //create new widget class for this 'home' to
        // escape 'No MediaQuery widget found' error
        );
  }
}

class Search extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF11CDEF),
          /*backgroundColor: Colors.transparent,
          elevation: 0.0,*/
          title: Center(
            child: Text('Search', style: TextStyle(color: Colors.white)),
          )),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.search),
    );
  }
}
