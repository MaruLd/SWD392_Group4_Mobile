import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:evsmart/color.dart';
import 'package:evsmart/models/DTO/ticketUser_model.dart';
import 'package:evsmart/models/DTO/ticketUser_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/viewModel/ticketUser_viewModel.dart';
import 'package:evsmart/viewModel/ticketUser_viewModel.dart';
import 'package:evsmart/widgets/ticketUser_item.dart';
import 'package:evsmart/widgets/feature_item.dart';
import 'package:evsmart/widgets/ticketUser_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_icons/line_icon.dart';

import 'package:scoped_model/scoped_model.dart';

class TicketPageBody extends StatefulWidget {
  const TicketPageBody({Key? key}) : super(key: key);

  @override
  _TicketPageBodyState createState() => _TicketPageBodyState();
}

class _TicketPageBodyState extends State<TicketPageBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 4),
            child: FutureBuilder(
                future: Get.find<TicketUserViewModel>().getTicket(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return new Container(
                      color: Colors.green.withOpacity(0.3),
                      width: MediaQuery.of(context).size.width, //70.0,
                      height: MediaQuery.of(context).size.height, //70.0,
                      child: new Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new Center(
                              child: new CircularProgressIndicator())),
                    );
                  }
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top: 12),
                        child: Column(
                            children: List.generate(
                                snapshot.data.length,
                                (index) => Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                    child: MyTicketUserItem(
                                      data: snapshot.data[index],
                                      onTap: () {},
                                    )))));
                    ;
                  }
                  return Text("No Data");
                })));
  }

  // getTabContent() {
  //   return ScopedModel<TicketViewModel>(
  //       model: Get.find<TicketViewModel>(),
  //       child: ScopedModelDescendant<TicketViewModel>(
  //           builder: (context, child, model) {
  //         List<Ticket>? courses = model.listTicket;
  //         if (courses == null)
  //           return Text("No Data");
  //         else
  //           return SingleChildScrollView(
  //               scrollDirection: Axis.vertical,
  //               padding: EdgeInsets.only(top: 12),
  //               child: Column(
  //                   children: List.generate(
  //                       courses.length,
  //                       (index) => Padding(
  //                           padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
  //                           child: MyTicketItem(
  //                             data: courses[index],
  //                             onTap: () {},
  //                           )))));
  //       }));
  // }
}
