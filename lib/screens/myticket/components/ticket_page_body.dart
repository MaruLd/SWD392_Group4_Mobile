import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:evsmart/color.dart';
import 'package:evsmart/models/DTO/userTicket_model.dart';
import 'package:evsmart/models/DTO/userTicket_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/viewModel/userTicket_viewModel.dart';
import 'package:evsmart/viewModel/userTicket_viewModel.dart';
import 'package:evsmart/widgets/ticketUser_item.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
                future: Get.find<UserTicketViewModel>().getTicket(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      color: Colors.green.withOpacity(0.3),
                      width: MediaQuery.of(context).size.width, //70.0,
                      height: MediaQuery.of(context).size.height, //70.0,
                      child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Center(child: CircularProgressIndicator())),
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

  @override
  void dispose() {
    super.dispose();
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
