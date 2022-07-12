import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:evsmart/color.dart';
import 'package:evsmart/models/DTO/event_model.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/viewModel/event_viewModel.dart';
import 'package:evsmart/widgets/event_item.dart';
import 'package:evsmart/widgets/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_icons/line_icon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';

// Future<List<Event>> fetchEvent({int page = 1}) async {
//   final response =
//       await http.get(Uri.parse('https://evsmart.herokuapp.com/api/v1/events'));

//   if (response.statusCode == 200) {
//     var responseJson = json.decode(response.body);
//     return (responseJson as List).map((e) => Event.fromJson(e)).toList();
//   } else {
//     throw Exception('Failed to load Event');
//   }
// }

class EventPageBody extends StatefulWidget {
  const EventPageBody({Key? key}) : super(key: key);

  @override
  _EventPageBodyState createState() => _EventPageBodyState();
}

class _EventPageBodyState extends State<EventPageBody> {
  // late Future<List<Event>> events;
  late Future<void> events;
  // var isLoaded = false;

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;
  int _currentIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // events = fetchEvent();
    events = Get.find<EventViewModel>().getEvent();
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 4),
            child: Column(children: [
              getAppBar("Featured Events"),
              getFeature(),
              getAppBar("Events"),
              getTabContent()
            ])));
  }

  int selectedCollection = 0;
  getFeature() {
    return ScopedModel<EventViewModel>(
        model: Get.find<EventViewModel>(),
        child: ScopedModelDescendant<EventViewModel>(
          builder: (context, child, model) {
            List<Event>? currentEvent = model.listEvent;
            if (currentEvent == null)
              return SizedBox(
                height: 30,
              );
            else
              return CarouselSlider(
                  options: CarouselOptions(
                    height: 280,
                    enlargeCenterPage: true,
                    disableCenter: true,
                    viewportFraction: .75,
                  ),
                  items: List.generate(
                      currentEvent.length,
                      (index) => FeatureItem(
                          onTap: () {}, data: currentEvent[index])));
          },
        ));
  }

  Widget getAppBar(String title) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
          ],
        ));
  }

  getTabContent() {
    return ScopedModel<EventViewModel>(
      model: Get.find<EventViewModel>(),
      child: ScopedModelDescendant<EventViewModel>(
          builder: (context, child, model) {
        List<Event>? courses = model.listEvent;
        if (courses == null)
          return SizedBox(
            height: 30,

          );
        else
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 12),
            child: Column(
              children: List.generate(
                courses.length,
                (index) => Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: MyEventItem(
                    data: courses[index],
                    onTap: () {},
                  ),
                ),
              ),
            ),
          );
      }),
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
