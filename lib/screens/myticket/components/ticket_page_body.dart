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
  late Future<void> tickets;

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;
  int _currentIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    tickets = Get.find<TicketViewModel>().getTicket();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print("Current value is $_currPageValue");
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // appBar: AppBar(
        //   //backgroundColor: const Color(0xFF11CDEF),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        //   title: Text('Ticket',
        //       style: TextStyle(
        //           color: kPrimaryColor,
        //           fontSize: 20,
        //           fontWeight: FontWeight.bold)),
        //   centerTitle: true,
        // ),
        child: getTabContent());
  }

  getTabContent() {
    return ScopedModel<TicketViewModel>(
        model: Get.find<TicketViewModel>(),
        child: ScopedModelDescendant<TicketViewModel>(
            builder: (context, child, model) {
          List<Ticket>? courses = model.listTicket;
          if (courses == null)
            return SizedBox(
              height: 30,
            );
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
