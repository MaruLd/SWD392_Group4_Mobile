import 'package:evsmart/screens/constraint.dart';
import 'package:flutter/material.dart';


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
}