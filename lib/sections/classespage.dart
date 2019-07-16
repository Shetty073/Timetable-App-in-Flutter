import 'package:flutter/material.dart';
import 'ItCsBms.dart';
import 'commerce.dart';
import '../main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// TODO: Remove redunduncy
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
  final int day;
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
              } else if (widget.branch == "Information Technology") {
                // Show loading progress indicator dialog
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        content: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CircularProgressIndicator(),
                            Text(
                              "\t\t\t\t\tLoading...",
                              style: TextStyle(
                                color: widget.bodyForegroundColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                if (_class[i] == "First Year") {
                  String tablename = "fy_it";
                  int day = widget.day;
                  Map data;
                  List list = [];
                  Future getData() async {
                    http.Response response = await http.get(
                        "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                    data = json.decode(response.body);
                    for (var item in data.keys) {
                      if (item != "week" && data[item] != null) {
                        list.add(data[item]);
                      }
                    }
                    Navigator.pop(
                        context); // Close the loading progress indicator dialog
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: TablePage(
                          title: "$ttl",
                          day: widget.day,
                          data: list,
                          bodyForegroundColor: widget.bodyForegroundColor,
                          textColor: widget.textColor,
                        ),
                      ),
                    );
                  }

                  getData();
                } else if (_class[i] == "Second Year") {
                  String tablename = "sy_it";
                  int day = widget.day;
                  Map data;
                  List list = [];
                  Future getData() async {
                    http.Response response = await http.get(
                        "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                    data = json.decode(response.body);
                    for (var item in data.keys) {
                      if (item != "week" && data[item] != null) {
                        list.add(data[item]);
                      }
                    }
                    Navigator.pop(
                        context); // Close the loading progress indicator dialog
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: TablePage(
                          title: "$ttl",
                          day: widget.day,
                          data: list,
                          bodyForegroundColor: widget.bodyForegroundColor,
                          textColor: widget.textColor,
                        ),
                      ),
                    );
                  }

                  getData();
                } else {
                  String tablename = "ty_it";
                  int day = widget.day;
                  Map data;
                  List list = [];
                  Future getData() async {
                    http.Response response = await http.get(
                        "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                    data = json.decode(response.body);
                    for (var item in data.keys) {
                      if (item != "week" && data[item] != null) {
                        list.add(data[item]);
                      }
                    }
                    Navigator.pop(
                        context); // Close the loading progress indicator dialog
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: TablePage(
                          title: "$ttl",
                          day: widget.day,
                          data: list,
                          bodyForegroundColor: widget.bodyForegroundColor,
                          textColor: widget.textColor,
                        ),
                      ),
                    );
                  }

                  getData();
                }
              } else if (widget.branch == "Computer Science") {
                if (_class[i] == "First Year") {
                  String tablename = "fy_cs";
                  int day = widget.day;
                  Map data;
                  List list = [];
                  Future getData() async {
                    http.Response response = await http.get(
                        "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                    data = json.decode(response.body);
                    for (var item in data.keys) {
                      if (item != "week" && data[item] != null) {
                        list.add(data[item]);
                      }
                    }
                    Navigator.pop(
                        context); // Close the loading progress indicator dialog
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: TablePage(
                          title: "$ttl",
                          day: widget.day,
                          data: list,
                          bodyForegroundColor: widget.bodyForegroundColor,
                          textColor: widget.textColor,
                        ),
                      ),
                    );
                  }

                  getData();
                } else if (_class[i] == "Second Year") {
                  String tablename = "sy_cs";
                  int day = widget.day;
                  Map data;
                  List list = [];
                  Future getData() async {
                    http.Response response = await http.get(
                        "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                    data = json.decode(response.body);
                    for (var item in data.keys) {
                      if (item != "week" && data[item] != null) {
                        list.add(data[item]);
                      }
                    }
                    Navigator.pop(
                        context); // Close the loading progress indicator dialog
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: TablePage(
                          title: "$ttl",
                          day: widget.day,
                          data: list,
                          bodyForegroundColor: widget.bodyForegroundColor,
                          textColor: widget.textColor,
                        ),
                      ),
                    );
                  }

                  getData();
                } else {
                  String tablename = "ty_cs";
                  int day = widget.day;
                  Map data;
                  List list = [];
                  Future getData() async {
                    http.Response response = await http.get(
                        "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                    data = json.decode(response.body);
                    for (var item in data.keys) {
                      if (item != "week" && data[item] != null) {
                        list.add(data[item]);
                      }
                    }
                    Navigator.pop(
                        context); // Close the loading progress indicator dialog
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: TablePage(
                          title: "$ttl",
                          day: widget.day,
                          data: list,
                          bodyForegroundColor: widget.bodyForegroundColor,
                          textColor: widget.textColor,
                        ),
                      ),
                    );
                  }

                  getData();
                }
              } else if (widget.branch == "Bachelor of Management Studies") {
                if (_class[i] == "First Year") {
                  String tablename = "fy_bms";
                  int day = widget.day;
                  Map data;
                  List list = [];
                  Future getData() async {
                    http.Response response = await http.get(
                        "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                    data = json.decode(response.body);
                    for (var item in data.keys) {
                      if (item != "week" && data[item] != null) {
                        list.add(data[item]);
                      }
                    }
                    Navigator.pop(
                        context); // Close the loading progress indicator dialog
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: TablePage(
                          title: "$ttl",
                          day: widget.day,
                          data: list,
                          bodyForegroundColor: widget.bodyForegroundColor,
                          textColor: widget.textColor,
                        ),
                      ),
                    );
                  }

                  getData();
                } else if (_class[i] == "Second Year") {
                  String tablename = "sy_bms";
                  int day = widget.day;
                  Map data;
                  List list = [];
                  Future getData() async {
                    http.Response response = await http.get(
                        "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                    data = json.decode(response.body);
                    for (var item in data.keys) {
                      if (item != "week" && data[item] != null) {
                        list.add(data[item]);
                      }
                    }
                    Navigator.pop(
                        context); // Close the loading progress indicator dialog
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: TablePage(
                          title: "$ttl",
                          day: widget.day,
                          data: list,
                          bodyForegroundColor: widget.bodyForegroundColor,
                          textColor: widget.textColor,
                        ),
                      ),
                    );
                  }

                  getData();
                } else {
                  String tablename = "ty_bms";
                  int day = widget.day;
                  Map data;
                  List list = [];
                  Future getData() async {
                    http.Response response = await http.get(
                        "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                    data = json.decode(response.body);
                    for (var item in data.keys) {
                      if (item != "week" && data[item] != null) {
                        list.add(data[item]);
                      }
                    }
                    Navigator.pop(
                        context); // Close the loading progress indicator dialog
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: TablePage(
                          title: "$ttl",
                          day: widget.day,
                          data: list,
                          bodyForegroundColor: widget.bodyForegroundColor,
                          textColor: widget.textColor,
                        ),
                      ),
                    );
                  }

                  getData();
                }
              }
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
