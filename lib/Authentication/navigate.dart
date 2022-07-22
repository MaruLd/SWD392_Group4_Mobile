import 'package:evsmart/Authentication/google_sign_in.dart';
import 'package:evsmart/screens/home/home_screen.dart';
import 'package:evsmart/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigateScreen extends StatelessWidget {
  static String routeName = "/navigate";

  const NavigateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              // GoogleSignInProvider.refreshFirebaseUser();
              return HomeScreen();
            } else if (snapshot.hasError) {
              return const Center(child: Text("Something went Wrong!"));
            } else {
              return LoginScreen();
            }
          }));
}
