import 'package:evsmart/mainComponent/default_button.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/screens/home/home_screen.dart';
import 'package:evsmart/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight*0.04),
        Image.asset("assets/imgaes/welcome.png"
        ),
        SizedBox(height: SizeConfig.screenHeight*0.08),
        Text("Login Success",style: TextStyle(
          fontSize: getProportionateScreenWidth(30),
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth *0.6,
          child: DefaultButton(
            text: "Go to home",
            press: ()=>Navigator.pushNamed(context, HomeScreen.routeName),
          ),
        ),
        Spacer(),
      ],
    );
  }
}