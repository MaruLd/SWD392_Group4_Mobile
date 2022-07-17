import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';
import 'package:evsmart/screens/detail/components/eventDetail_page_body.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:flutter/material.dart';
import '../constraint.dart';

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
            icon: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
          ),
          title: const Text(
            "Detail",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: EventDetailPageBody(eventId: eventId),
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.favorite),
      ),
    );
  }
}
