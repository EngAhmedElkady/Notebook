import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:text_note/database/database.dart';
import 'package:text_note/model/notemodel.dart';

class Newnote extends StatefulWidget {
  static final Route = '1';
  @override
  _NewnoteState createState() => _NewnoteState();
}

class _NewnoteState extends State<Newnote> {
  // dataclass
  String title="empty";
  String content="empty";
  Databasse dbhelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbhelper = Databasse();
  }

 // var key1=GlobalKey<>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(" add new note"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter Course name'
                ),
                onChanged: (value){
                  setState(() {
                    title= value;
                  });
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: 'Enter Course Content'
                ),
                onChanged: (value){
                  setState(() {
                    content = value;
                  });
                },
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: () async {
              Note_Model note =
              new Note_Model({'title': title, 'content': content});
              int id = await dbhelper.creat_note(note);
              showDialog(context: context,
              builder:(BuildContext context){
                return AlertDialog(
                  title:Text('pass'),
                  content:Text("you add the new note"),
                );
              }
              );
              Navigator.of(context).pop();

          }),
    );
  }
}
