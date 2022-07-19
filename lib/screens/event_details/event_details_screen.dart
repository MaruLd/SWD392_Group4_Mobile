import 'package:evsmart/models/DTO/eventAgenda_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/screens/event_details/components/details_page_body.dart';
import 'package:flutter/material.dart';

import '../constraint.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';

import '../search/SearchData.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.eventId});

  static String routeName = "/agenda";
  final String eventId;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              "",
              style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),*/
        body: EventDetailsPageBody(eventId: eventId),
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.favorite),
      ),
    );
  }
}
