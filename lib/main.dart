import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './sections/sections.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Table',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        accentColor: Colors.amberAccent
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // theme: ThemeData.light(),
      home: MyHomePage(title: 'Timetable'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  MyHomePage get widget => super.widget;
  List<Widget> _getCards() {
    List _weeks = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    List<Widget> crds = List<Widget>();
    for (var i = 0; i < _weeks.length; i++) {
      crds.add(Container(
        child: Card(
          color: Colors.amber[50],
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BranchesPage(
                            title: "Select branch",
                            day: _weeks[i],
                          )));
            },
            child: Container(
              width: 300,
              height: 70,
              child: Center(
                child: Text(
                  _weeks[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        margin: EdgeInsets.only(
          top: 5.0,
          bottom: 5.0,
        ),
      ),
      );
    }
    return crds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: _getCards(),
        ),
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       ListTile(
      //         title: Text("About"),
      //         onTap: () {
      //           print("Tap");
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
