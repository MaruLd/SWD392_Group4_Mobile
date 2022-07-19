import 'package:evsmart/color.dart';
import 'package:evsmart/models/DTO/ticket_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:flutter/material.dart';

class TicketItem extends StatefulWidget {
  TicketItem({Key? key, required this.ticket, this.onTap}) : super(key: key);
  Ticket ticket;
  final GestureTapCallback? onTap;
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

  @override
  _TicketItemState createState() => _TicketItemState();

}

class _TicketItemState extends State<TicketItem> {
   late Color color;

//   void _updateColor(Color color){
//     if(mounted)
// setState(()=> _color = color);
//   }

  @override
  void initState() {
    super.initState();
    color = Colors.white;
    // Get.find<EventAgendaViewModel>().getEventAgenda(widget.eventId);
    // Get.find<EventDetailViewModel>().getEventDetail(widget.eventId);
    // Get.find<TicketViewModel>().getTicket(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    final _isSelected=false;
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
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
            SizedBox(
              width: 8,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.ticket.name.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Type: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.ticket.type.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17,
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
                      Text(
                        "Cost: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.ticket.cost.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Quantity left: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.ticket.quantity.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Description: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.ticket.description.toString(),
                        style: TextStyle(fontSize: 17, color: labelColor),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
//       onTap: () {
//         setState(() {
// _updateColor(Colors.greenAccent);
//         });
//       },
    );
  }
}