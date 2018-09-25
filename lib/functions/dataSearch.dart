import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final cities = ["Colombo", "Kurunegala", "Kandy", "Nuwaraeliya"];
  final recentCities = ["Colombo", "Kurunegala"];
  @override
  List<Widget> buildActions(BuildContext context) {
    // acctions for search
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
            color: Colors.red,
            child: Center(
              child: Text(query),
            )),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when some one searches for something
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => (p.toLowerCase()).startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context); //from buildResults
            },
            leading: Icon(Icons.location_city),
            //chainging the font color of suggetion word
            title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ]),
            ),
          ),
      itemCount: suggestionList.length,
    );
  }
}
