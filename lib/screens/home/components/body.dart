import 'package:evsmart/models/DTO/event_model.dart';
import 'package:evsmart/screens/home/components/event_page_body.dart';
import 'package:evsmart/viewModel/event_viewModel.dart';
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
      ],
    ));
  }
}
