import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:top3eats/by_dish.dart';
import 'package:top3eats/home.dart';
import 'package:top3eats/my_eats.dart';
import 'package:top3eats/profile.dart';

void main() => runApp(new Top3Eats());

class Top3Eats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomePage(),
      // routes: <String, WidgetBuilder>{
      //   "/a":(BuildContext context)=>NewPage("New Page"),
      // }
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top3Eat"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
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
              title: Text("Profile"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Profile("Profile")));
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
