import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../models/DTO/event_model.dart';
import '../../../viewModel/event_viewModel.dart';
import '../../../widgets/event_item.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 4),
            child: Column(children: [
              getFavoriteTabContent()
            ])));
  }
  getFavoriteTabContent() {
    return ScopedModel<EventViewModel>(
      model: Get.find<EventViewModel>(),
      child: ScopedModelDescendant<EventViewModel>(
          builder: (context, child, model) {
            List<Event>? courses = model.listEvent;
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
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: MyEventItem(
                        data: courses[index],
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              );
          }),
    );
  }
}