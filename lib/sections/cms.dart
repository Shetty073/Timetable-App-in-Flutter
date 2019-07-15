import 'package:flutter/material.dart';

class CommerceTablePage extends StatefulWidget {
  CommerceTablePage(
      {Key key,
      this.title,
      this.data,
      this.bodyForegroundColor,
      this.textColor})
      : super(key: key);
  final String title;
  final List data; // This will contain the time table
  final Color bodyForegroundColor;
  final Color textColor;
  @override
  _CommercePageTable createState() => _CommercePageTable();
}

class _CommercePageTable extends State<CommerceTablePage> {
  @override
  CommerceTablePage get widget => super.widget;
  List<Widget> _getBranches() {
    List<Widget> crds = List<Widget>();
    print(widget.data);
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
