import 'package:flutter/material.dart';
import 'ItCsBms.dart';
import 'commerce.dart';


class ClassesPage extends StatefulWidget {
  ClassesPage({Key key, this.title, this.day, this.branch}) : super(key: key);
  final String title;
  final String day;
  final String branch;

  @override
  _ClassesPageState createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  @override
  ClassesPage get widget => super.widget;
  List<Widget> _getBranches() {
    List _class = [
      "First Year",
      "Second Year",
      "Third Year"
    ];
    List<Widget> crds = List<Widget>();
    for (var i = 0; i < _class.length; i++) {
      crds.add(Container(
        child: Card(
          color: Colors.amber[50],
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              String ttl;
              String brnch = widget.branch;
              switch (_class[i]) {
                case "First Year": ttl="FY $brnch";
                break;
                case "Second Year": ttl="SY $brnch";
                break;
                case "Third Year": ttl="TY $brnch";
                break;
                default: ttl="";
              }
              if (widget.branch == "Commerce") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommercePage(
                      title: ttl,
                      day: widget.day,
                      branch: brnch,
                      cls: _class[i],
                    )
                  )
                  ); //TODO: Implement commerce divisions
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TablePage(
                      title: "$ttl",
                      day: widget.day,
                      branch: widget.branch,
                      cls: _class[i],
                    )
                  )
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

