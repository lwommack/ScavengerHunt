import 'package:flutter/material.dart';

class Choose_Hunt extends StatefulWidget {
  Choose_Hunt({Key key, this.title}) : super(key : key);

  final String title;

  @override
  _Choose_Hunt_State createState() => _Choose_Hunt_State();

}

class _Choose_Hunt_State extends State<Choose_Hunt> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? ''),),
      body: Column(
        children: <Widget>[
          Text("Coming Soon"),
        ],
      ),
    );
  }
}