import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Scavengar Hunt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = new TextEditingController();
  List<String> items = [];
  bool iconState = false;

  void addItem(String item) {
    if(item.length > 0)
      setState(() => items.add(item));
  }

  Widget buildList() {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index < items.length) {
            return buildItem(items[index]);
          }
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
            decoration: new InputDecoration(
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
    return new ListTile(
      title: Text(item),
      leading: iconState ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
      onTap: () {
        iconState = !iconState;
        setState(() {

        });
      },
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
          enterItem(),
          buildList(),
        ],
      ),
    );
  }
}
