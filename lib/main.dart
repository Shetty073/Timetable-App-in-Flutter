import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './sections/sections.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> randColorList = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.indigo,
      Colors.orange
    ];
    List<Color> randAccentColorList = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.green[400],
      Colors.indigoAccent,
      Colors.orangeAccent[400]
    ];
    Random random;
    int choice;
    int min = 0;
    int max = randColorList.length;
    random = new Random();
    choice = min + random.nextInt(max - min);
    return MaterialApp(
      title: 'Time Table',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: randColorList[choice],
          accentColor: randAccentColorList[choice]),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // theme: ThemeData.light(),
      home: MyHomePage(
        title: 'Timetable',
        bodyForegroundColor: randAccentColorList[choice],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.bodyForegroundColor}) : super(key: key);
  final String title;
  final Color bodyForegroundColor;
  final Color textColor = Colors.white;

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
      crds.add(
        Container(
          child: Card(
            color: widget.bodyForegroundColor,
            child: InkWell(
              splashColor: widget.bodyForegroundColor,
              onTap: () {
                Navigator.push(
                  context,
                  SlideRightRoute(
                    page: BranchesPage(
                      title: "Select branch",
                      day: _weeks[i],
                      bodyForegroundColor: widget.bodyForegroundColor,
                      textColor: widget.textColor,
                    ),
                  ),
                );
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
                      color: widget.textColor,
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.title),
            )
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: _getCards(),
        ),
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      ),
      // App Drawer
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

// Custom page route animation
class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
