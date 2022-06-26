import 'package:evsmart/Authentication/navigate.dart';
import 'package:evsmart/screens/login_success/login_success_screen.dart';
import 'package:evsmart/screens/myticket/myticket_screen.dart';
import 'package:evsmart/screens/search/search_screen.dart';
import 'package:evsmart/screens/splash/splash_screen.dart';
import 'package:evsmart/screens/success/bookingsuccess.dart';
import 'package:flutter/material.dart';
import 'package:evsmart/screens/setting/setting_screen.dart';
import 'package:evsmart/screens/favorite/favorite_screen.dart';
import 'package:evsmart/screens/home/home_screen.dart';
import 'error/error_screen.dart';
import 'login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SettingScreen.routeName: (context) => SettingScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ErrorScreen.routeName: (context) => ErrorScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  NavigateScreen.routeName: (context) => NavigateScreen(),
  MyTicketScreen.routeName: (context) => MyTicketScreen(),
  BookingSuccess.routeName: (context) => BookingSuccess(),
};
