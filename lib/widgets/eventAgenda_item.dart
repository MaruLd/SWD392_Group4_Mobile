import 'package:evsmart/color.dart';
import 'package:evsmart/models/DTO/eventAgenda_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MyEventAgendaItem extends StatelessWidget {
  MyEventAgendaItem({Key? key, required this.data, this.onTap})
      : super(key: key);
  EventAgenda data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const QRScannerScreen()),
      // ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 60),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.black,
                                  size: 10,
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  data.title.toString(),
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: 5,),
                                Icon(
                                  Icons.circle,
                                  color: Colors.black,
                                  size: 10,
                                ),
                              ],
                            ),
                          ),
                          // Agenda Time
                          Column(
                            children: [
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Icon(
                                    Icons.schedule_rounded,
                                    color: kPrimaryColor,
                                    size: 18,
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
                                        fontSize: 18,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Icon(
                                    Icons.schedule_rounded,
                                    color: kPrimaryColor,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    DateFormat("MM/dd/yyyy hh:mm a")
                                        .format(data.endTime as DateTime)
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
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
