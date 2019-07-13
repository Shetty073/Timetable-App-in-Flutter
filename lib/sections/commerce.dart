import 'package:flutter/material.dart';
import './cms.dart';
import '../main.dart';

class CommercePage extends StatefulWidget {
  CommercePage(
      {Key key,
      this.title,
      this.day,
      this.branch,
      this.cls,
      this.bodyForegroundColor,
      this.textColor})
      : super(key: key);
  final String title;
  final String day;
  final String branch;
  final String cls;
  final Color bodyForegroundColor;
  final Color textColor;

  @override
  _CommercePageState createState() => _CommercePageState();
}

class _CommercePageState extends State<CommercePage> {
  @override
  CommercePage get widget => super.widget;
  List<Widget> _getBranches() {
    List _div = ["A", "B", "C"];
    List<Widget> crds = List<Widget>();
    for (var i = 0; i < _div.length; i++) {
      crds.add(Container(
        child: Card(
          color: widget.bodyForegroundColor,
          child: InkWell(
            splashColor: widget.bodyForegroundColor,
            onTap: () {
              String ttl = widget.title;
              String dv = _div[i];
              switch (_div[i]) {
                case "A":
                  ttl = "$ttl $dv";
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      page: CommerceTablePage(
                        title: "$ttl",
                        day: widget.day,
                        branch: widget.branch,
                        cls: widget.cls,
                        div: dv,
                        bodyForegroundColor: widget.bodyForegroundColor,
                        textColor: widget.textColor,
                      ),
                    ),
                  );
                  break;
                case "B":
                  ttl = "$ttl $dv";
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      page: CommerceTablePage(
                        title: "$ttl",
                        day: widget.day,
                        branch: widget.branch,
                        cls: widget.cls,
                        div: _div[i],
                        bodyForegroundColor: widget.bodyForegroundColor,
                        textColor: widget.textColor,
                      ),
                    ),
                  );
                  break;
                case "C":
                  ttl = "$ttl $dv";
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      page: CommerceTablePage(
                        title: "$ttl",
                        day: widget.day,
                        branch: widget.branch,
                        cls: widget.cls,
                        div: _div[i],
                        bodyForegroundColor: widget.bodyForegroundColor,
                        textColor: widget.textColor,
                      ),
                    ),
                  );
                  break;
                default:
                  ttl = "";
              }
              // print(_div[i]);
              // print(widget.day);
              // print(widget.branch);
            },
            child: Container(
              width: 300,
              height: 150,
              child: Center(
                child: Text(
                  _div[i],
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
