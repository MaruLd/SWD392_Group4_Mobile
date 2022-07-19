import 'package:flutter/material.dart';
import '../constraint.dart';
import '../enums.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';
import '../search/SearchData.dart';
import 'components/event_page_body.dart';

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
            IconButton( icon: Icon(
              Icons.search,
              color: kPrimaryColor,
            ),
            onPressed: (){
      showSearch(context: context, delegate: DataSearch());
      }
            )
          ],
          //backgroundColor: const Color(0xFF11CDEF),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Flexible(
            child: Row(
              children:[
                Image.asset("assets/images/slogo.png",),
                Text('event',
                    style:
                    TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 25)
                ),
              ] ,
            ),
          ),

        ),
        body: EventPageBody(),
        bottomNavigationBar: const CustomBottomNavBar(
          selectedMenu: MenuState.home,
        ),
      ),
    );
  }
}
