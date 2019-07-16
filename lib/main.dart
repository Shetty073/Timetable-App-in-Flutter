import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './sections/sections.dart';
import 'dart:math';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> randColorList = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.indigo
    ];
    List<Color> randAccentColorList = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.green[400],
      Colors.indigoAccent
    ];
    Random random;
    int choice;
    int min = 0;
    int max = randColorList.length;
    random = new Random();
    choice = min + random.nextInt(max - min);
    return MaterialApp(
      title: 'TimeTable',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: randColorList[choice],
          accentColor: randAccentColorList[choice]),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // theme: ThemeData.light(),
      home: MyHomePage(
        title: 'TimeTable',
        bodyForegroundColor: randAccentColorList[choice],
        appBarColor: randColorList[choice],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.bodyForegroundColor, this.appBarColor})
      : super(key: key);
  final String title;
  final Color bodyForegroundColor;
  final Color textColor = Colors.white;
  final Color appBarColor;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // For android toast notifications
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // void showInSnackBar(String toast) {
  //   scaffoldKey.currentState.showSnackBar(SnackBar(
  //     content: Text(toast),
  //     action: SnackBarAction(
  //       label: "Okay",
  //       onPressed: () {},
  //     ),
  //   ));
  // }

  // About dialog box
  void _showAboutDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            title: Text(
              "TimeTable App",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            content: Text(
              "Author: Ashish H. Shetty\nGitHub: https://github.com/Shetty073/Timetable-App-in-Flutter",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Text(
                  "Copy link",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: widget.bodyForegroundColor,
                  ),
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(
                      text:
                          "https://github.com/Shetty073/Timetable-App-in-Flutter"));
                  // showInSnackBar("Link copied to clipboard");
                  Toast.show(
                    "Link copied to clipboard",
                    context,
                    gravity: Toast.CENTER,
                    duration: Toast.LENGTH_LONG,
                    textColor: widget.bodyForegroundColor,
                    backgroundColor: Colors.white,
                  );
                },
                splashColor: widget.appBarColor,
                color: Colors.white,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Text(
                  "Close",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: widget.bodyForegroundColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                splashColor: widget.appBarColor,
                color: Colors.white,
              ),
            ],
            backgroundColor: widget.bodyForegroundColor,
          );
        });
  }

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
                      day: i + 1,
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
      // key: scaffoldKey, // For toast notiications
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: _getCards(),
        ),
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "TimeTable App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
              ),
              decoration: BoxDecoration(
                color: widget.appBarColor,
              ),
            ),
            ListTile(
              title: Text(
                "About",
                style: TextStyle(
                  color: widget.appBarColor,
                ),
              ),
              subtitle: Text(
                "about the developer",
                style: TextStyle(
                  color: widget.bodyForegroundColor,
                ),
              ),
              onTap: () {
                _showAboutDialog(); // Call the function which displays about dialog box
              },
            ),
          ],
        ),
      ),
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
