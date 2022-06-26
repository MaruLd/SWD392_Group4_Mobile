import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/screens/myticket/myticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/screens/favorite/favorite_screen.dart';
import 'package:evsmart/screens/home/home_screen.dart';
import 'package:evsmart/screens/setting/setting_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
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
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            // tabBackgroundColor: const Color(0xFF11CDEF),
            color: Colors.white,
            tabs: [
              GButton(
                  icon: LineIcons.home,
                  //iconActiveColor: Colors.white,
                  //text: 'Home',
                  textColor: Colors.white,
                  //onPressed: ()=>Navigator.pushNamed(context, HomeScreen.routeName),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }),
              GButton(
                  icon: LineIcons.heart,
                  iconActiveColor: Colors.white,
                  //text: 'Likes',
                  textColor: Colors.white,
                  //onPressed: ()=>Navigator.pushNamed(context, FavoriteScreen.routeName),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoriteScreen()),
                    );
                  }),
              GButton(
                icon: LineIcons.moneyCheck,
                iconActiveColor: Colors.white,
                // text: 'My Tickets',
                textColor: Colors.white,
                //onPressed: ()=>Navigator.pushNamed(context, SearchScreen.routeName),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyTicketScreen())),
              ),
              GButton(
                icon: LineIcons.user,
                iconActiveColor: Colors.white,
                // text: 'Setting',
                textColor: Colors.white,
                //onPressed: ()=>Navigator.pushNamed(context, SettingScreen.routeName),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
