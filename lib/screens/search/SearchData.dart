import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container();
  }
}
class DataSearch extends SearchDelegate<String>{

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
   return [IconButton(icon: Icon(Icons.clear), onPressed: (){
     query ="";
   })];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,)
      , onPressed: (){Navigator.pop(context);});
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentEvents:events;
 return ListView.builder(itemBuilder: (context, index)=> ListTile(
      leading: LineIcon(LineIcons.moneyCheck),
   title: Text(suggestionList[index]),
 ), itemCount: suggestionList.length,
 );
  }

}