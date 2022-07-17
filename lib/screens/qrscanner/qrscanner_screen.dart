import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:flutter/material.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';

import '../search/SearchData.dart';
import 'components/qrscanner_page_body.dart';

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({Key? key, required this.ticketId}) : super(key: key);
  final String ticketId;
  static String routeName = "/qrscanner";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          //backgroundColor: const Color(0xFF11CDEF),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Ticket QR Scanner',
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: QRScannerPageBody(ticketId: ticketId),
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.mytickets),
      ),
    );
  }
}
