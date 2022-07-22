import 'package:evsmart/Authentication/navigate.dart';
import 'package:evsmart/screens/event_details/event_details_screen.dart';
import 'package:evsmart/screens/login_success/login_success_screen.dart';
import 'package:evsmart/screens/myticket/myticket_screen.dart';
import 'package:evsmart/screens/splash/splash_screen.dart';
import 'package:evsmart/screens/success/bookingsuccess.dart';
import 'package:flutter/material.dart';
import 'package:evsmart/screens/setting/setting_screen.dart';
import 'package:evsmart/screens/home/home_screen.dart';
import 'error/error_screen.dart';
import 'login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SettingScreen.routeName: (context) => SettingScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  // EventDetailsScreen.routeName: (context) => EventDetailsScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ErrorScreen.routeName: (context) => ErrorScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  NavigateScreen.routeName: (context) => NavigateScreen(),
  MyTicketScreen.routeName: (context) => MyTicketScreen(),
  BookingSuccess.routeName: (context) => BookingSuccess(),
};
