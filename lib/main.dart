import 'package:flutter/material.dart';
import 'package:text_note/pages/Home.dart';
import 'package:text_note/pages/newnote.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.grey[800]),
      debugShowCheckedModeBanner: false,
      initialRoute: Home.Route,
      routes: {
        Newnote.Route: (c) => Newnote(),
        Home.Route: (c) => Home(),
      },
    );
  }
}
