import 'package:evsmart/color.dart';
import 'package:evsmart/custom_image.dart';
import 'package:evsmart/models/DTO/eventDetail_model.dart';
import 'package:evsmart/models/DTO/ticket_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/DTO/event_model.dart';

class MyEventDetailItem extends StatelessWidget {
  MyEventDetailItem({Key? key, required this.data, this.onTap})
      : super(key: key);
  EventDetail data;
  final GestureTapCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => AgendaScreen(eventId: data.id ?? "")),
      // ),
/*
      child: Container(
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImage(
                data.imageUrl ?? "/assest/images/pic4.png",
                radius: 15,
                height: 90,
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.62,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title.toString(),
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
                        Icon(
                          Icons.schedule_rounded,
                          color: kPrimaryColor,
                          size: 14,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          DateFormat("MM/dd/yyyy hh:mm a")
                              .format(data.startTime as DateTime)
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
                            data.location.toString(),
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
          )),*/
      child: Container(
        child: Column(
          children: [
            CustomImage(
              data.imageUrl ?? "/assest/images/pic4.png",
              height: 250,
              width: 500,
              borderRadius: BorderRadius.circular(0),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            data.title.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: textColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              // SizedBox(
                              //   width: 20,
                              // ),
                              Icon(
                                Icons.schedule_rounded,
                                color: kPrimaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                DateFormat("MM/dd/yyyy hh:mm a")
                                    .format(data.startTime as DateTime)
                                    .toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: red,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Flexible(
                                    child: Text(
                                      data.location.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16, color: labelColor),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(""),
                              SizedBox(height: 5),

                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 265, bottom: 5),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: kPrimaryColor, // background
                                    onPrimary: Colors.white, // for
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                    ), // eground
                                  ),
                                  child: Text('Regrister'),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => SimpleDialog(
                                        title:
                                            const Text('Select Booking Type'),
                                        children: <Widget>[
                                         /* DropdownButton(
                                            items: const [
                                              DropdownMenuItem(child: Text("General"), value: "",),
                                              DropdownMenuItem(child: Text("Sliver"), value: "",),
                                              DropdownMenuItem(child: Text("Gold"), value: "",),
                                            ],
                                          ),*/
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
