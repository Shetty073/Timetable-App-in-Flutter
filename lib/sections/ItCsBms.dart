import 'package:flutter/material.dart';
// import '../main.dart';

class TablePage extends StatefulWidget {
  TablePage(
      {Key key,
      this.title,
      this.day,
      this.data,
      this.bodyForegroundColor,
      this.textColor})
      : super(key: key);
  final String title;
  final int day; // 1, 2, 3, etc
  final List data; // This will contain the time table
  final Color bodyForegroundColor; // Color for cards (elements in foreground)
  final Color textColor;

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  TablePage get widget => super.widget;
  List<Widget> _getBranches() {
    List<Widget> crds = List<Widget>();
    for (var i = 0; i < widget.data.length; i++) {
      crds.add(Container(
        child: Card(
          color: widget.bodyForegroundColor,
          child: InkWell(
            splashColor: widget.bodyForegroundColor,
            onTap: () {},
            child: Container(
              width: 300,
              height: 70,
              child: Center(
                child: Text(
                  widget.data[i],
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
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      ),
    );
  }
}
