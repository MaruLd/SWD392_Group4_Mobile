import 'dart:ffi';
import 'package:evsmart/models/DTO/event_model.dart';
import 'package:evsmart/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../../models/DTO/event_model.dart';
import '../../../viewModel/eventdetail_viewModel.dart';

class EventPageBody extends StatefulWidget {
  const EventPageBody({Key? key, required this.eventId})
      : super(key: key);

  final String eventId;

  @override
  _EventPageBodyState createState() => _EventPageBodyState();
}

class _EventPageBodyState extends State<EventPageBody> {
  late Future<void> Event;
  @override
  void initState() {
    super.initState();
    Event = Get.find<EventDetailViewModel>().getEventDetail(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 4), child: getTabContent()));
  }

  getTabContent() {
    Text("Detail: ");
    return ScopedModel<EventDetailViewModel>(
        model: Get.find<EventDetailViewModel>(),
        child: ScopedModelDescendant<EventDetailViewModel>(
            builder: (context, child, model) {
              List<Event>? courses = model.listEventDAO;
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
                                child: MyEventItem(
                                  data: courses[index],
                                  onTap: () {},
                                )))));
            }));
  }
}
