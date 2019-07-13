import 'package:flutter/material.dart';
import './cms.dart';
import '../main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    List<Widget> crds = List<Widget>();
    for (var i = 0; i < _div.length; i++) {
      crds.add(Container(
        child: Card(
          color: widget.bodyForegroundColor,
          child: InkWell(
            splashColor: widget.bodyForegroundColor,
            onTap: () {
              int day = widget.day;
              String ttl = widget.title;
              String dv = _div[i];
              switch (_div[i]) {
                case "A":
                  ttl = "$ttl $dv";
                  if (widget.cls == "First Year") {
                    String tablename = "fy_commerce_a";
                    Map data;
                    List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://192.168.0.100/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                    }

                    getData();
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
                  } else if (widget.cls == "Second Year") {
                    String tablename = "sy_commerce_a";
                    Map data;
                    List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://192.168.0.100/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                    }

                    getData();
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
                  } else {
                    String tablename = "ty_commerce_a";
                    Map data;
                    List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://192.168.0.100/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                    }

                    getData();
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
                  break;
                case "B":
                  ttl = "$ttl $dv";
                  if (widget.cls == "First Year") {
                    String tablename = "fy_commerce_b";
                    Map data;
                    List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://192.168.0.100/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                    }

                    getData();
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
                  } else if (widget.cls == "Second Year") {
                    String tablename = "sy_commerce_b";
                    Map data;
                    List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://192.168.0.100/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                    }

                    getData();
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
                  } else {
                    String tablename = "ty_commerce_b";
                    Map data;
                    List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://192.168.0.100/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                    }

                    getData();
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
                  break;
                case "C":
                  ttl = "$ttl $dv";
                  if (widget.cls == "First Year") {
                    String tablename = "fy_commerce_c";
                    Map data;
                    List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://192.168.0.100/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                    }

                    getData();
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
                  } else if (widget.cls == "Second Year") {
                    String tablename = "sy_commerce_c";
                    Map data;
                    List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://192.168.0.100/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                    }

                    getData();
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
                  } else {
                    String tablename = "ty_commerce_c";
                    Map data;
                    List list = [];
                    Future getData() async {
                      http.Response response = await http.get(
                          "http://192.168.0.100/index.php?class=$tablename&day=$day");
                      data = json.decode(response.body);
                      for (var item in data.keys) {
                        if (item != "week" && data[item] != null) {
                          list.add(data[item]);
                        }
                      }
                    }

                    getData();
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
