import 'package:evsmart/screens/home/home_screen.dart';
import 'package:evsmart/screens/routes.dart';
import 'package:evsmart/screens/splash/splash_screen.dart';
import 'package:evsmart/mainComponent/Configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Authentication/google_sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'MainPage';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          home: SplashScreen(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ),
      );
}
