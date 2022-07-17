import 'dart:ffi';

import 'package:evsmart/models/DAO/eventAgenda_DAO.dart';
import 'package:evsmart/models/DTO/eventAgenda_model.dart';
import 'package:evsmart/viewModel/eventAgenda_viewModel.dart';
import 'package:evsmart/widgets/eventAgenda_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:scoped_model/scoped_model.dart';

class EventAgendaPageBody extends StatefulWidget {
  const EventAgendaPageBody({Key? key, required this.eventId})
      : super(key: key);

  final String eventId;

  @override
  _EventAgendaPageBodyState createState() => _EventAgendaPageBodyState();
}

class _EventAgendaPageBodyState extends State<EventAgendaPageBody> {
  late Future<void> agendas;
  @override
  void initState() {
    super.initState();
    agendas = Get.find<EventAgendaViewModel>().getEventAgenda(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 4), child: getTabContent()));
  }

  getTabContent() {
    Text("Agenda: ");
    return ScopedModel<EventAgendaViewModel>(
        model: Get.find<EventAgendaViewModel>(),
        child: ScopedModelDescendant<EventAgendaViewModel>(
            builder: (context, child, model) {
          List<EventAgenda>? courses = model.listEventAgenda;
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
                            child: MyEventAgendaItem(
                              data: courses[index],
                              onTap: () {},
                            )))));
        }));
  }
}
