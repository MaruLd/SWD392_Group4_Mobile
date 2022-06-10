import 'package:evsmart/screens/home/home_screen.dart';
import 'package:evsmart/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../Authentication/google_sign_in.dart';
import '../../constraint.dart';

class Body extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Login",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(19),
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              "assets/images/login.png",
            ),
            Obx(
              (() {
                if (user == null)
                  return FloatingActionButton.extended(
                    onPressed: () {
                      final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
                    },
                    icon: Image.asset(
                      'assets/images/google_logo.png',
                      height: 32,
                      width: 32,
                    ),
                    label: Text('Sign in with Google'),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  );
                else
                  return HomeScreen();
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Column buildProfileView() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       CircleAvatar(
  //         backgroundImage:
  //             Image.network(controller.googleAccount.value?.photoUrl ?? '')
  //                 .image,
  //         radius: 100,
  //       ),
  //       Text(
  //         controller.googleAccount.value?.displayName ?? '',
  //         style: Get.textTheme.headline3,
  //       ),
  //       Text(
  //         controller.googleAccount.value?.email ?? '',
  //         style: Get.textTheme.bodyText1,
  //       ),
  //       ActionChip(
  //         avatar: Icon(Icons.logout),
  //         label: Text('Logout'),
  //         onPressed: () {
  //           controller.logout();
  //         },
  //       ),
  //     ],
  //   );
  // }
}
