import 'package:flutter/material.dart';
import './classespage.dart';
import '../main.dart';

class BranchesPage extends StatefulWidget {
  BranchesPage(
      {Key key, this.title, this.day, this.bodyForegroundColor, this.textColor})
      : super(key: key);
  final String title;
  final String day;
  final Color bodyForegroundColor;
  final Color textColor;

  @override
  _BranchesPageState createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {
  @override
  BranchesPage get widget => super.widget;
  List<Widget> _getBranches() {
    List _branch = [
      "Information Technology",
      "Computer Science",
      "Commerce",
      "Bachelor of Management Studies"
    ];
    List<Widget> crds = List<Widget>();
    for (var i = 0; i < _branch.length; i++) {
      crds.add(Container(
        child: Card(
          color: widget.bodyForegroundColor,
          child: InkWell(
            splashColor: widget.bodyForegroundColor,
            onTap: () {
              Navigator.push(
                context,
                SlideRightRoute(
                  page: ClassesPage(
                    title: "Select class",
                    day: widget.day,
                    branch: _branch[i],
                    bodyForegroundColor: widget.bodyForegroundColor,
                    textColor: widget.textColor,
                  ),
                ),
              );
              // print(_branch[i]);
              // print(widget.day);
            },
            child: Container(
              width: 300,
              height: 110,
              child: Center(
                child: Text(
                  _branch[i],
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
          top: 10.0,
          bottom: 5.0,
        ),
      ));
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
          children: _getBranches(),
        ),
        margin: EdgeInsets.only(top: 20.0),
      ),
    );
  }
}
