
import 'package:evsmart/screens/enums.dart';
import 'package:flutter/material.dart';
import '../constraint.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';
import '../home/components/event_page_body.dart';

class EventBody extends StatelessWidget {
  const EventBody({super.key, required this.eventId});

  static String routeName = "/detail";
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
            "Detail",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: EventPageBody(eventId: eventId),
        bottomNavigationBar:
        const CustomBottomNavBar(selectedMenu: MenuState.favorite),
      ),
    );
  }
}
