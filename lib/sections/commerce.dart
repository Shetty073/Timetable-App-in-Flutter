import 'package:flutter/material.dart';
import './cms.dart';


class CommercePage extends StatefulWidget {
  CommercePage({Key key, this.title, this.day, this.branch, this.cls}) : super(key: key);
  final String title;
  final String day;
  final String branch;
  final String cls;

  @override
  _CommercePageState createState() => _CommercePageState();
}

class _CommercePageState extends State<CommercePage> {
  @override
  CommercePage get widget => super.widget;
  List<Widget> _getBranches() {
    List _div = [
      "A",
      "B",
      "C"
    ];
    List<Widget> crds = List<Widget>();
    for (var i = 0; i < _div.length; i++) {
      crds.add(Container(
        child: Card(
          color: Colors.amber[50],
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              String ttl = widget.title;
              String dv = _div[i];
              switch (_div[i]) {
                case "A": ttl="$ttl $dv";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommerceTablePage(
                      title: "$ttl",
                      day: widget.day,
                      branch: widget.branch,
                      cls: widget.cls,
                      div: dv,
                    )
                    )
                );
                break;
                case "B": ttl="$ttl $dv";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommerceTablePage(
                      title: "$ttl",
                      day: widget.day,
                      branch: widget.branch,
                      cls: widget.cls,
                      div: _div[i],
                    )
                    )
                );
                break;
                case "C": ttl="$ttl $dv";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommerceTablePage(
                      title: "$ttl",
                      day: widget.day,
                      branch: widget.branch,
                      cls: widget.cls,
                      div: _div[i],
                    )
                    )
                );
                break;
                default: ttl="";
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
                    color: Colors.grey,
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

