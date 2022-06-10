import 'package:flutter/material.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/screens/favorite/favorite_screen.dart';
import 'package:evsmart/screens/home/home_screen.dart';
import 'package:evsmart/screens/setting/setting_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../screens/search/search_screen.dart';
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {

    final Color inActiveIconColor = Color(0xFFB6B6B6);

    return Container(

        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
        ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Color(0xFF11CDEF),
            color: Colors.black,
            tabs: [
              GButton(
                icon: LineIcons.home,
                iconActiveColor: Colors.white,
                text: 'Home',
                textColor: Colors.white,
                onPressed: ()=>Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              GButton(
                icon: LineIcons.heart,
                iconActiveColor: Colors.white,
                text: 'Likes',
                textColor: Colors.white,
                onPressed: ()=>Navigator.pushNamed(context, FavoriteScreen.routeName),
              ),
              GButton(
                icon: LineIcons.search,
                iconActiveColor: Colors.white,
                text: 'Search',
                textColor: Colors.white,
                onPressed: ()=>Navigator.pushNamed(context, SearchScreen.routeName),
              ),
              GButton(
                icon: LineIcons.user,
                iconActiveColor: Colors.white,
                text: 'Setting',
                textColor: Colors.white,
                onPressed: ()=>Navigator.pushNamed(context, SettingScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}