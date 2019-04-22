import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CreateHunt extends StatefulWidget {
  CreateHunt({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateHuntState createState() => _CreateHuntState();
}

class _CreateHuntState extends State<CreateHunt> {
  TextEditingController _controller = TextEditingController();
  Map<String, bool> items = Map<String, bool>();

  void addItem(String item) {
    if(item.length > 0)
      setState(() => items.addAll({item: false}));
  }

  Widget buildList() {
    return Flexible(
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (index < items.length) {
            return buildItem(items.keys.elementAt(index));
          }
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget enterItem() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: _controller,
            autofocus: false,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                fillColor: Theme.of(context).dialogBackgroundColor,
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                hintText: 'Enter an item...',
                contentPadding: const EdgeInsets.all(16.0)),
          ),
        ),
        RaisedButton(
          onPressed: () {
            addItem(_controller.value.text);
            _controller.clear();
          },
          child: Text('Submit'),
          color: Theme.of(context).buttonColor,
        ),
      ],
    );
  }

  Widget buildItem(String item) {
    return ListTile(
      title: Text(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(padding: EdgeInsets.symmetric(vertical: 5.0),),
          enterItem(),
          Container(padding: EdgeInsets.symmetric(vertical: 5.0),),
          buildList(),
        ],
      ),
    );
  }
}
