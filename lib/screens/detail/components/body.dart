import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/pic1.png"),
                  ),
                ),
              )),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  width: 45,
                  height: 45,
                  child: Icon(Icons.arrow_back,color: Colors.white,),
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPrimaryColor,
                  ),
                ),
                Container(
                  width: 45,
                  height: 45,
                  child: Icon(Icons.confirmation_num,color: Colors.white,),
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),*/
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 220,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(40)),
                child: Image.asset(
                  "assets/images/pic1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text(
                    "Múa rối nước",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: const Text(
                    "Traditional",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          LineIcon.alternateMoneyCheck(),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "  500T ",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          LineIcon.registeredTrademarkAlt(),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "  1000 ",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Content here",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14,
                  color: Colors.black),),
                ),
                Column(children: const <Widget>[
                ],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
