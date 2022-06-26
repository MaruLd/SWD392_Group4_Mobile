import 'package:evsmart/screens/constraint.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: TabBar(
        labelColor: kPrimaryColor,
        indicatorColor: kPrimaryColor,
        tabs: [
        Tab(text: 'Event',),
        Tab(text: 'Voucher',),
      ],),
    );
  }
}