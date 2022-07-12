import 'package:evsmart/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class LogoutDiaLog{
  _confirmResult(bool isYes, BuildContext context){
if(isYes){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
}else{
  Navigator.pop(context);
}
  }

  confirm(BuildContext context, String title, String description){
    return showDialog(context: context,barrierDismissible: true ,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Do you want to log out?"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("")
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(onPressed: ()=> _confirmResult(false, context),
            child: Text("No"),
          ),
          FlatButton(onPressed: ()=> _confirmResult(true, context),
            child: Text("Yes"),
          ),
        ],
      );
    }
    );
  }

}