import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:top3eats/functions/dataSearch.dart';
import 'package:top3eats/pages/by_dish.dart';
import 'package:top3eats/pages/home.dart';
import 'package:top3eats/pages/my_eats.dart';
import 'package:top3eats/pages/profile.dart';
import 'package:top3eats/pages/map_page.dart';

void main() {
  runApp(new Top3Eats());
}

class Top3Eats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: LandingPage(),
      // routes: <String, WidgetBuilder>{
      //   "/a":(BuildContext context)=>NewPage("New Page"),
      // }
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top3Eat"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Lakshman"),
              accountEmail: Text("lakkaru@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.brown,
                child: Text("L"),
              ),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Home("Home")));
              },
            ),
            ListTile(
              title: Text("By Dish"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ByDish("By Dish")));
              },
            ),
            ListTile(
              title: Text("My Eats"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyEats("My Eats")));
              },
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Profile("Profile")));
              },
            ),
            ListTile(
              title: Text("Map"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MapPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Top3Eats Your way to the top dish!"),
        ),
      ),
    );
  }
}
