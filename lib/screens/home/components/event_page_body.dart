import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:evsmart/color.dart';
import 'package:evsmart/models/DTO/event_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/widgets/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_icons/line_icon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';

Future<List<Event>> fetchEvent({int page = 1}) async {
  final response =
      await http.get(Uri.parse('https://evsmart.herokuapp.com/api/v1/events'));

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    return (responseJson as List).map((e) => Event.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load Event');
  }
}

class EventPageBody extends StatefulWidget {
  const EventPageBody({Key? key}) : super(key: key);

  @override
  _EventPageBodyState createState() => _EventPageBodyState();
}

class _EventPageBodyState extends State<EventPageBody> {
  late Future<List<Event>> events;
  // var isLoaded = false;

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    events = fetchEvent();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print("Current value is $_currPageValue");
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
// HEAD
        //Slider
        Container(
          margin: const EdgeInsets.only(top: 24),
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //Dot
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: kPrimaryColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //Popular
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              const Text(
                "Popular",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        // getFeature(),

        // //Slider
        // Container(
        //   margin: const EdgeInsets.only(top: 24),
        //   height: 320,
        //   child: PageView.builder(
        //       controller: pageController,
        //       itemCount: 3,
        //       itemBuilder: (context, position) {
        //         return _buildPageItem(position);
        //       }),
        // ),
        // //Dot
        // DotsIndicator(
        //   dotsCount: 5,
        //   position: _currPageValue,
        //   decorator: DotsDecorator(
        //     activeColor: kPrimaryColor,
        //     size: const Size.square(9.0),
        //     activeSize: const Size(18.0, 9.0),
        //     activeShape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5.0)),
        //   ),
        // ),
        // //Popular
        // const SizedBox(
        //   height: 30,
        // ),
        // Container(
        //   margin: const EdgeInsets.only(left: 30),
        //   child: Row(
        //     children: [
        //       const Text(
        //         "Popular",
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //       const SizedBox(
        //         width: 10,
        //       ),
        //       Container(),
        //       const SizedBox(
        //         width: 10,
        //       ),
        //     ],
        //   ),
        // ),

        // Example for call event API
        Container(
          margin:
              const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Center(
                child: FutureBuilder<List<Event>>(
                  future: events,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.elementAt(0).title.toString());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              )
            ],
          ),
        )
        // list of Popular Event
        // ListView.builder(
        //     physics: const NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     itemCount: 5,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         margin: const EdgeInsets.only(
        //             top: 15, left: 20, right: 20, bottom: 10),
        //         child: Row(
        //           children: [
        //             //image section
        //             Container(
        //               width: 120,
        //               height: 120,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(10),
        //                   color: Colors.white38,
        //                   image: const DecorationImage(
        //                       fit: BoxFit.cover,
        //                       image: AssetImage("assets/images/pic5.png"))),
        //             ),
        //             //text container
        //             Expanded(
        //               child: Container(
        //                 height: 130,
        //                 decoration: const BoxDecoration(
        //                   borderRadius: BorderRadius.only(
        //                     topRight: Radius.circular(20),
        //                     bottomRight: Radius.circular(20),
        //                   ),
        //                   color: Colors.white,
        //                 ),
        //                 child: Padding(
        //                   padding: const EdgeInsets.only(left: 10, right: 10),
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       const Text(
        //                         "Event title",
        //                         overflow: TextOverflow.ellipsis,
        //                         style: TextStyle(
        //                             fontSize: 20, fontWeight: FontWeight.bold),
        //                       ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       const Text(
        //                         "Event createDate",
        //                         overflow: TextOverflow.ellipsis,
        //                         style: TextStyle(fontSize: 10),
        //                       ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       Row(
        //                         //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           LineIcon.alternateMoneyCheck(),
        //                           const Text(
        //                             "Event description",
        //                             style: TextStyle(
        //                                 fontStyle: FontStyle.italic,
        //                                 fontSize: 12),
        //                           ),
        //                         ],
        //                       ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       );
        //     }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
// Slider's animation
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(left: 2, right: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kPrimaryColor,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/pic1.png"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 35, right: 35, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Múa rối nước",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "1000",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Register",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        LineIcon.alternateMoneyCheck(),
                        const Text(
                          "  500T",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
