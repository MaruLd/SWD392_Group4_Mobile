import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/screens/home/home_screen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(BookingSuccess());
}
class BookingSuccess extends StatelessWidget{
  static String routeName ="/booking_success";
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:Scaffold(
      body: Column(

        children: [
        Spacer(),
          Image.asset("assets/images/hurray.png"
          ),
          Text("",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor
          ),
          ),
          Text( "   Congratulations   ", textAlign: TextAlign.center	, style: TextStyle(color: Colors.green,fontSize: 30,fontWeight: FontWeight.bold),),
          Text(""),
          Text( "You have successfully booked your ticket", textAlign: TextAlign.center	, style: TextStyle(color: Colors.green, fontSize: 15, fontStyle: FontStyle.italic),),
          Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),),
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  HomeScreen()),
            );},
            child: Text(
              "Back to Home".toUpperCase(),
            ),
          ),
          Spacer(),
        ],
      ),
    )
    );
  }
}