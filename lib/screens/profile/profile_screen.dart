import 'package:evsmart/screens/constraint.dart';
import 'package:flutter/material.dart';
import '../profile/components/body.dart';


/*void main(){
  runApp(ProfileScreen());
}*/
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading:IconButton(icon:  Icon(Icons.arrow_back,),onPressed: (){
        Navigator.pop(context);
      }),
      // On Android it's false by default
      centerTitle: true,
      title: Text("Profile"),
    );
  }
}
