import 'package:evsmart/models/DTO/eventAgenda_model.dart';
import 'package:evsmart/screens/agenda/components/eventAgenda_page_body.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:flutter/material.dart';

import '../constraint.dart';
import '../agenda/components/body.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';

import '../search/SearchData.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key, required this.eventId});

  static String routeName = "/agenda";
  final String eventId;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
          ),
          title: Text(
            "Agenda",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: EventAgendaPageBody(eventId: eventId),
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.favorite),
      ),
    );
  }
}
