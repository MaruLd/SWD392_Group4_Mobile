import 'package:evsmart/color.dart';
import 'package:evsmart/custom_image.dart';
import 'package:evsmart/models/DTO/userTicket_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/screens/qrscanner/components/qrscanner_page_body.dart';
import 'package:evsmart/screens/qrscanner/qrscanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/DTO/event_model.dart';

class MyTicketUserItem extends StatelessWidget {
  MyTicketUserItem({Key? key, required this.data, this.onTap})
      : super(key: key);
  UserTicket data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QRScannerScreen(
                  ticketId: data.ticket!.id ?? "",
                  ticketState: data.state ?? "",
                )),
      ),
      child: Container(
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/ticket.png',
                width: 120,
                height: 100,
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.52,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ticket: " + data.name.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Text("Check-In: "),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          data.checkedInDate == null
                              ? data.state ?? "Not yet"
                              : DateFormat("MM/dd/yyyy hh:mm a")
                                  .format(data.checkedInDate as DateTime)
                                  .toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Text("Check-Out: "),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          data.checkedOutDate == null
                              ? data.state ?? "Not yet"
                              : DateFormat("MM/dd/yyyy hh:mm a")
                                  .format(data.checkedOutDate as DateTime)
                                  .toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Icon(
                          Icons.location_on_outlined,
                          color: red,
                          size: 14,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Flexible(
                          child: Text(
                            data.type.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: labelColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget buildProgress(
      {Color? activeColor,
      Color? inactiveColor,
      double progress = 1,
      double? height,
      double width = 100}) {
    if (inactiveColor == null) {
      inactiveColor = Colors.grey;
    }
    if (height == null) {
      height = 4;
    }
    if (progress > 1) {
      progress /= 100;
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: inactiveColor,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Stack(
        children: <Widget>[
          Container(
            width: width * progress,
            height: height,
            decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.all(Radius.circular(4))),
          )
        ],
      ),
    );
  }
}
