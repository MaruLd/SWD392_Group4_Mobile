import 'package:evsmart/models/DTO/ticket_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/screens/myticket/components/ticket_page_body.dart';
import 'package:evsmart/viewModel/ticket_viewModel.dart';
import 'package:evsmart/widgets/ticket_item.dart';
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
            child: TicketPageBody(),
          ),
        ),
      ],
    ));
  }
}
