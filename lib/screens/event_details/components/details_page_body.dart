import 'dart:ffi';

import 'package:evsmart/mainComponent/Configs/theme.dart';
import 'package:evsmart/models/DAO/eventAgenda_DAO.dart';
import 'package:evsmart/models/DTO/eventAgenda_model.dart';
import 'package:evsmart/viewModel/eventAgenda_viewModel.dart';
import 'package:evsmart/viewModel/eventDetail_viewModel.dart';
import 'package:evsmart/viewModel/ticket_viewModel%20copy.dart';
import 'package:evsmart/widgets/eventAgenda_item.dart';
import 'package:evsmart/widgets/ticket_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../models/DTO/eventDetail_model.dart';
import '../../../widgets/eventDetail_item.dart';
import '../../constraint.dart';

class EventDetailsPageBody extends StatefulWidget {
  const EventDetailsPageBody({Key? key, required this.eventId})
      : super(key: key);

  final String eventId;

  @override
  _EventDetailsPageBodyState createState() => _EventDetailsPageBodyState();
}

class _EventDetailsPageBodyState extends State<EventDetailsPageBody> {
  @override
  void initState() {
    super.initState();
    Get.find<EventAgendaViewModel>().getEventAgenda(widget.eventId);
    Get.find<EventDetailViewModel>().getEventDetail(widget.eventId);
    Get.find<TicketViewModel>().getTicket(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 4),
            child: Column(children: [
/*              getHeaderBar("Details"),*/
              getDetailContent(),
              getEventTicketContent(),
              getAgendaContent(),
            ])));
  }

  Widget getHeaderBar(String title) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
          ],
        ));
  }

  getDetailContent() {
    const Text("Detail: ");
    return ScopedModel<EventDetailViewModel>(
        model: Get.find<EventDetailViewModel>(),
        child: ScopedModelDescendant<EventDetailViewModel>(
            builder: (context, child, model) {
          EventDetail? detail = model.eventDetail;
          if (detail == null) {
            return const SizedBox(
              height: 30,
            );
          } else {
            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 12),
                child: MyEventDetailItem(data: detail));
          }
        }));
  }

  getAgendaContent() {
    return ScopedModel<EventAgendaViewModel>(
        model: Get.find<EventAgendaViewModel>(),
        child: ScopedModelDescendant<EventAgendaViewModel>(
            builder: (context, child, model) {
          List<EventAgenda>? courses = model.listEventAgenda;
          if (courses == null)
            return Text("No data");
          else
            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 12),
                child: Column(
                    children: List.generate(
                        courses.length,
                        (index) => Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: MyEventAgendaItem(
                              data: courses[index],
                              onTap: () {},
                            )))));
        }));
  }

  getEventTicketContent() {
    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 4),
        child: FutureBuilder(
            future: Get.find<TicketViewModel>().getTicket(widget.eventId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return new Container(
                  color: Colors.green.withOpacity(0.3),
                  width: MediaQuery.of(context).size.width, //70.0,
                  height: MediaQuery.of(context).size.height, //70.0,
                  child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          new Center(child: new CircularProgressIndicator())),
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
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: TicketItem(
                                  data: snapshot.data[index],
                                  onTap: () {},
                                )))));
                ;
              }
              return Text("No Data");
            }));
  }
}
