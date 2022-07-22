import 'package:evsmart/Authentication/google_sign_in.dart';
import 'package:evsmart/models/DAO/ticket_DAO.dart';
import 'package:evsmart/screens/success/bookingsuccess.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmDialog {
  _confirmResult(bool isYes, String ticketId, BuildContext context) {
    if (isYes) {
      TicketDAO ticketDAO = new TicketDAO();
      ticketDAO.buyTicket(ticketId: ticketId);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BookingSuccess()));
    } else {
      Navigator.pop(context);
    }
  }

  confirm(
      BuildContext context, String ticketId, String title, String description) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure you want to buy this ticket?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text("")],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => _confirmResult(false, ticketId, context),
                child: Text("No"),
              ),
              FlatButton(
                onPressed: () => _confirmResult(true, ticketId, context),
                child: Text("Yes"),
              ),
            ],
          );
        });
  }
}
