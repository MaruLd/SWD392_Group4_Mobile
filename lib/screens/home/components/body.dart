import 'package:evsmart/models/event.dart';
import 'package:evsmart/screens/home/components/event_page_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        //header
        Container(),
        //body
        const Expanded(
          child: SingleChildScrollView(
            child: EventPageBody(),
          ),
        ),
        //     Container(
        //   // margin: EdgeInsets.only(top: 45, left: 15),
        //   // padding: EdgeInsets.only(),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         children: [
        //           Text(
        //             "Evsmart",
        //             style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               fontSize: 35,
        //               // color: kPrimaryColor
        //             ),
        //           ),
        //         ],
        //       ),
        //       Container(
        //         width: 45,
        //         height: 45,
        //         child: Icon(
        //           Icons.search,
        //           color: Colors.white,
        //         ),
        //         margin: EdgeInsets.only(right: 15),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(30),
        //           // color: kPrimaryColor,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        //body

        // Flexible(
        //   child: EventPageBody(),
        // )
      ],
    ));
  }
}
