import 'package:evsmart/screens/error/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DataSearch extends SearchDelegate<String> {
  final events = [
    "Mây Lang Thang",
    "Như một lời chia tay",
    "LA VELA SAIGON",
    "Sài Gòn Tếu",
  ];

  final recentEvents = [
    "Mây Lang Thang",
    "Như một lời chia tay",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Tra ve trang detail cua event sau khi nhan vao`
    return ErrorScreen(
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentEvents
        : events.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: LineIcon(LineIcons.moneyCheck),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
         children: [
           TextSpan(
           text: suggestionList[index].substring(query.length),
           style: TextStyle(color: Colors.grey))
         ])
          ),
        ),
      itemCount: suggestionList.length,
    );
  }
}
