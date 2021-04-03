import 'package:control_language/Route/Route_names.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AbouPageState createState() => _AbouPageState();
}

class _AbouPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Page'),),
      body: Container(
        child: MaterialButton(
          color: Colors.blue,
          child: Text('to setting page'),
          onPressed: ()=> Navigator.of(context).pushNamed(settingRoute),
        ),
      ),
    );
  }
}
