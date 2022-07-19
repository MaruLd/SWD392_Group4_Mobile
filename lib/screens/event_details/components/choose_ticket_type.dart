import 'package:evsmart/mainComponent/default_button.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/screens/event_details/components/confirmDialog.dart';

import 'package:evsmart/viewModel/ticket_viewModel.dart';
import 'package:evsmart/widgets/ticket_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
/*


class BookingDialog extends StatefulWidget{
  _BookingDialog createState() => _BookingDialog();

}
class _BookingDialog extends State<BookingDialog>{
  List<String> items =['General', 'VIP'];
String ? selectedItem='General';
  @override
  Widget build(BuildContext context)=> Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: kPrimaryColor,),
        ),
        //backgroundColor: const Color(0xFF11CDEF),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
body: Column(
  children: [
    Text("Select your Ticket type", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: kPrimaryColor),),
SizedBox(height: 40,),
        Center(
      child:   SizedBox(
        width: 240,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 4, color: kPrimaryColor),
            ),
          ),
          value: selectedItem,
          items: items.map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: TextStyle(fontSize: 20, color: Colors.black),),
          )).toList(),
          onChanged: (item) => setState(()=> selectedItem = item),
        ),
      ),
    ),
  ],
)  );
}*/

class TicketType extends StatefulWidget {
  const TicketType({Key? key, required this.eventId}) : super(key: key);

  final String eventId;

  @override
  _TicketTypeState createState() => _TicketTypeState();
}

class _TicketTypeState extends State<TicketType> {
  @override
  void initState() {
    super.initState();
    // Get.find<EventAgendaViewModel>().getEventAgenda(widget.eventId);
    // Get.find<EventDetailViewModel>().getEventDetail(widget.eventId);
    // Get.find<TicketViewModel>().getTicket(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    ConfirmDialog diaLogs = new ConfirmDialog();
    ;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: kPrimaryColor,),
          ),
          //backgroundColor: const Color(0xFF11CDEF),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
              'Select your ticket type', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 25)
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(

            padding: EdgeInsets.fromLTRB(0, 10, 0, 4),
            child: Column(children: [
              getEventTicketContent(),
              SizedBox(
                height: 40,
              ),
              DefaultButton(
                text: "Continue",
                press: () => diaLogs.confirm(context, 'Do you want to log out', ''),
              ),
            ])));
  }

  getEventTicketContent() {
    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 4),
        child: FutureBuilder(
            future: Get.find<TicketViewModel>().getTicket(widget.eventId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return new Container(
                  color: Colors.green.withOpacity(0.3),
                  width: MediaQuery.of(context).size.width, //70.0,
                  height: MediaQuery.of(context).size.height, //70.0,
                  child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          new Center(child: new CircularProgressIndicator())),
                );
              }
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 12),
                  child: Column(
                    children: List.generate(
                      snapshot.data.length,
                      (index) => Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: TicketItem(
                          data: snapshot.data[index],
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Text("No Data");
            }));
  }
}
