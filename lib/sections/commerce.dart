import 'package:flutter/material.dart';
import './cms.dart';
import '../main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// TODO: Remove redunduncy
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
  final int day;
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
    List list = [];
    List<Widget> crds = List<Widget>();
    for (var i = 0; i < _div.length; i++) {
      crds.add(Container(
        child: Card(
          color: widget.bodyForegroundColor,
          child: InkWell(
            splashColor: widget.bodyForegroundColor,
            onTap: () {
              // Show loading progress indicator
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
              int day = widget.day;
              String ttl = widget.title;
              String dv = _div[i];
              switch (_div[i]) {
                case "A":
                  ttl = "$ttl $dv";
                  if (widget.cls == "First Year") {
                    String tablename = "fy_commerce_A";
                    Map data;
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                      Navigator.pop(context); // Close the loading progress indicator dialog
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: CommerceTablePage(
                            title: "$ttl",
                            data: list,
                            bodyForegroundColor: widget.bodyForegroundColor,
                            textColor: widget.textColor,
                          ),
                        ),
                      );
                    }

                    getData();
                  } else if (widget.cls == "Second Year") {
                    String tablename = "sy_commerce_A";
                    Map data;
                    // List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                      Navigator.pop(context); // Close the loading progress indicator dialog
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: CommerceTablePage(
                            title: "$ttl",
                            data: list,
                            bodyForegroundColor: widget.bodyForegroundColor,
                            textColor: widget.textColor,
                          ),
                        ),
                      );
                    }

                    getData();
                  } else {
                    String tablename = "ty_commerce_A";
                    Map data;
                    // List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                      Navigator.pop(context); // Close the loading progress indicator dialog
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: CommerceTablePage(
                            title: "$ttl",
                            data: list,
                            bodyForegroundColor: widget.bodyForegroundColor,
                            textColor: widget.textColor,
                          ),
                        ),
                      );
                    }

                    getData();
                  }
                  break;
                case "B":
                  ttl = "$ttl $dv";
                  if (widget.cls == "First Year") {
                    String tablename = "fy_commerce_B";
                    Map data;
                    // List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                      Navigator.pop(context); // Close the loading progress indicator dialog
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: CommerceTablePage(
                            title: "$ttl",
                            data: list,
                            bodyForegroundColor: widget.bodyForegroundColor,
                            textColor: widget.textColor,
                          ),
                        ),
                      );
                    }

                    getData();
                  } else if (widget.cls == "Second Year") {
                    String tablename = "sy_commerce_B";
                    Map data;
                    // List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                      Navigator.pop(context); // Close the loading progress indicator dialog
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: CommerceTablePage(
                            title: "$ttl",
                            data: list,
                            bodyForegroundColor: widget.bodyForegroundColor,
                            textColor: widget.textColor,
                          ),
                        ),
                      );
                    }

                    getData();
                  } else {
                    String tablename = "ty_commerce_B";
                    Map data;
                    // List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                      Navigator.pop(context); // Close the loading progress indicator dialog
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: CommerceTablePage(
                            title: "$ttl",
                            data: list,
                            bodyForegroundColor: widget.bodyForegroundColor,
                            textColor: widget.textColor,
                          ),
                        ),
                      );
                    }

                    getData();
                  }
                  break;
                case "C":
                  ttl = "$ttl $dv";
                  if (widget.cls == "First Year") {
                    String tablename = "fy_commerce_C";
                    Map data;
                    // List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                      Navigator.pop(context); // Close the loading progress indicator dialog
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: CommerceTablePage(
                            title: "$ttl",
                            data: list,
                            bodyForegroundColor: widget.bodyForegroundColor,
                            textColor: widget.textColor,
                          ),
                        ),
                      );
                    }

                    getData();
                  } else if (widget.cls == "Second Year") {
                    String tablename = "sy_commerce_C";
                    Map data;
                    // List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                      Navigator.pop(context); // Close the loading progress indicator dialog
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: CommerceTablePage(
                            title: "$ttl",
                            data: list,
                            bodyForegroundColor: widget.bodyForegroundColor,
                            textColor: widget.textColor,
                          ),
                        ),
                      );
                    }

                    getData();
                  } else {
                    String tablename = "ty_commerce_C";
                    Map data;
                    // List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://indiangamingclan.ga/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                      Navigator.pop(context); // Close the loading progress indicator dialog
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: CommerceTablePage(
                            title: "$ttl",
                            data: list,
                            bodyForegroundColor: widget.bodyForegroundColor,
                            textColor: widget.textColor,
                          ),
                        ),
                      );
                    }

                    getData();
                  }
                  break;
                default:
                  ttl = "";
              }
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
