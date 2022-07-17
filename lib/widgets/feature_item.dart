import 'package:evsmart/color.dart';
import 'package:evsmart/custom_image.dart';
import 'package:evsmart/models/DTO/event_model.dart';
import 'package:evsmart/screens/agenda/agenda_screen.dart';
import 'package:evsmart/screens/agenda/components/eventAgenda_page_body.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeatureItem extends StatelessWidget {
  FeatureItem(
      {Key? key,
      required this.data,
      this.width = 280,
      this.height = 240,
      this.onTap})
      : super(key: key);
  Event data;
  final double width;
  final double height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgendaScreen(eventId: data.id ?? "")),
      ),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomImage(
              data.imageUrl ?? "/assest/images/pic4.png",
              width: double.infinity,
              height: 140,
              radius: 1,
              borderRadius: BorderRadius.circular(10),
            ),
            Positioned(
              top: 144,
              child: Container(
                width: width,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 44,
                      child: Text(
                        data.title ?? "Event",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.schedule_rounded,
                          color: kPrimaryColor,
                          size: 18,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          DateFormat("MM/dd/yyyy hh:mm a")
                              .format(data.startTime as DateTime)
                              .toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
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
                          Icons.location_on_outlined,
                          color: red,
                          size: 20,
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
              ),
            )
          ],
        ),
      ),
    );
  }

  getAttribute(IconData icon, Color color, String info) {
    return Row(
      children: [
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: labelColor, fontSize: 16),
        ),
        SizedBox(
          width: 4,
        ),
        Icon(
          icon,
          size: 20,
          color: color,
        ),
      ],
    );
  }
}
