import 'package:evsmart/screens/enums.dart';
import 'package:flutter/material.dart';

import '../constraint.dart';
import '../favorite/components/body.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';

import '../search/SearchData.dart';


class FavoriteScreen extends StatelessWidget{
  static String routeName ="/favorite";
  
  @override
  Widget build(BuildContext context){
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: kPrimaryColor,),
          ),
          title: Text(
            "Favorite",
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