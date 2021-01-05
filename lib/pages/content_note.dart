import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  static final Route = '2';
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Content"),
        centerTitle: true,
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
