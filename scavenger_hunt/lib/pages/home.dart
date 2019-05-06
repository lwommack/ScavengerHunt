import 'package:flutter/material.dart';
import 'choose_hunt.dart';
import 'hunt_create.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void chooseHunt() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return Choose_Hunt(title: 'Select A Scavenger Hunt');
    }));
  }

  void createHunt() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return HuntCreate(title: 'Create A New Scavenger Hunt');
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                SnackBar(
                    content: SnackBarAction(
                        label: 'Login Coming Soon',
                        onPressed: null,
                    ),
                );
              },
            ),
            RaisedButton(
              child: Text('Select Scavnegar Hunt'),
              onPressed: chooseHunt,
            ),
            RaisedButton(
              child: Text('Create Scavnegar Hunt'),
              onPressed: createHunt,
            ),
          ],
        ),
      ),
    );
  }
}
