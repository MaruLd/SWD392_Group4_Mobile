// import 'package:evsmart/models/DTO/event_model.dart';
// import 'package:evsmart/screens/home/components/event_page_body.dart';

import 'package:dio/dio.dart';
import 'package:evsmart/models/DTO/event_model.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scoped_model/scoped_model.dart';

Future<List<Event>> fetchEvent() async {
  int currentPage = 1;
  bool isLoading = false;
  Response response = await Dio().get(
      'https://evsmart.herokuapp.com/api/v1/events?page=$currentPage&page-size=10');

  if (response.statusCode == 200) {
    var responseJson = response.data as List;
    var listEvents = responseJson.map((i) => Event.fromJson(i)).toList();
    return listEvents;
  } else {
    throw Exception('Failed to load Event');
  }
}

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _scrollController = new ScrollController();
  late Future<List<Event>> events;

  @override
  void initState() {
    super.initState();
    events = fetchEvent();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     events = fetchEvent();
    //   }
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Widget _buildProgressIndicator() {
  //   return new Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: new Center(
  //       child: new Opacity(
  //         opacity: isLoading ? 1.0 : 00,
  //         child: new CircularProgressIndicator(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Event>>(
        future: events,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, position) {
                  var event = (snapshot.data as List<Event>)[position];
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          event.title ?? "Title",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          event.startTime.toString(),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, position) {
                  return Divider();
                },
                itemCount: (snapshot.data as List<Event>).length);
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Center(
            child:
                CircularProgressIndicator(backgroundColor: Colors.cyanAccent),
          );
        },
      ),
    );
  }
}


// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//         children: <Widget>[
//           //header
//           Container(),
//           //body
//           const Expanded(
//             child: SingleChildScrollView(
//               child: EventPageBody(),
//             ),
//           ),
//             Container(
//           // margin: EdgeInsets.only(top: 45, left: 15),
//           // padding: EdgeInsets.only(),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "Evsmart",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 35,
//                       // color: kPrimaryColor
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 width: 45,
//                 height: 45,
//                 child: Icon(
//                   Icons.search,
//                   color: Colors.white,
//                 ),
//                 margin: EdgeInsets.only(right: 15),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   // color: kPrimaryColor,
//                 ),
//               )
//             ],
//           ),
//         ),
//         body

//         Flexible(
//           child: EventPageBody(),
//         )
//           ],
//         )
//         );
//   }
// }
