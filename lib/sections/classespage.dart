import 'package:flutter/material.dart';
import 'ItCsBms.dart';
import 'commerce.dart';
import '../main.dart';

class ClassesPage extends StatefulWidget {
  ClassesPage(
      {Key key,
      this.title,
      this.day,
      this.branch,
      this.bodyForegroundColor,
      this.textColor})
      : super(key: key);
  final String title;
  final String day;
  final String branch;
  final Color bodyForegroundColor;
  final Color textColor;

  @override
  _ClassesPageState createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  @override
  ClassesPage get widget => super.widget;
  List<Widget> _getBranches() {
    List _class = ["First Year", "Second Year", "Third Year"];
    List<Widget> crds = List<Widget>();
    for (var i = 0; i < _class.length; i++) {
      crds.add(Container(
        child: Card(
          color: widget.bodyForegroundColor,
          child: InkWell(
            splashColor: widget.bodyForegroundColor,
            onTap: () {
              String ttl;
              String brnch = widget.branch;
              switch (_class[i]) {
                case "First Year":
                  ttl = "FY $brnch";
                  break;
                case "Second Year":
                  ttl = "SY $brnch";
                  break;
                case "Third Year":
                  ttl = "TY $brnch";
                  break;
                default:
                  ttl = "";
              }
              if (widget.branch == "Commerce") {
                Navigator.push(
                  context,
                  SlideRightRoute(
                    page: CommercePage(
                      title: ttl,
                      day: widget.day,
                      branch: brnch,
                      cls: _class[i],
                      bodyForegroundColor: widget.bodyForegroundColor,
                      textColor: widget.textColor,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  SlideRightRoute(
                    page: TablePage(
                      title: "$ttl",
                      day: widget.day,
                      branch: widget.branch,
                      cls: _class[i],
                      bodyForegroundColor: widget.bodyForegroundColor,
                      textColor: widget.textColor,
                    ),
                  ),
                );
              }
              // print(_class[i]);
              // print(widget.day);
              // print(widget.branch);
            },
            child: Container(
              width: 300,
              height: 150,
              child: Center(
                child: Text(
                  _class[i],
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
