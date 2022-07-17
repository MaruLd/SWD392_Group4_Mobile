import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:evsmart/color.dart';
import 'package:evsmart/models/DTO/ticket_model.dart';
import 'package:evsmart/models/DTO/ticket_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/viewModel/ticket_viewModel.dart';
import 'package:evsmart/viewModel/ticket_viewModel.dart';
import 'package:evsmart/widgets/ticket_item.dart';
import 'package:evsmart/widgets/feature_item.dart';
import 'package:evsmart/widgets/ticket_item.dart';
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
    Get.find<TicketViewModel>().getTicket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 4),
            child: SingleChildScrollView(child: getTabContent())));
  }

  getTabContent() {
    return ScopedModel<TicketViewModel>(
        model: Get.find<TicketViewModel>(),
        child: ScopedModelDescendant<TicketViewModel>(
            builder: (context, child, model) {
          List<Ticket>? courses = model.listTicket;
          if (courses == null)
            return Text("No Data");
          else
            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 12),
                child: Column(
                    children: List.generate(
                        courses.length,
                        (index) => Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: MyTicketItem(
                              data: courses[index],
                              onTap: () {},
                            )))));
        }));
  }
}
