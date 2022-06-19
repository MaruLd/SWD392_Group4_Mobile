import 'package:evsmart/screens/setting/components/profile_pic.dart';
import 'package:flutter/material.dart';
import 'setting_menu.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const ProfilePic(),
        const SizedBox(height: 20),

        ProfileMenu(
          icon:"assets/icons/profile1.svg",
          text: "My Account",
        press: (){},),
        TicketMenu(
          icon:"assets/icons/ticket.svg",
          text: "My Ticket",
          press: (){},),
        SettingMenu(
          icon:"assets/icons/setting.svg",
          text: "Setting",
          press: (){},),
        PolicyMenu(
          icon:"assets/icons/policy.svg",
          text: "Term & Policy",
          press: (){},)
    ],
    );
  }
}
