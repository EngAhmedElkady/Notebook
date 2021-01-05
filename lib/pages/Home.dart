import 'package:flutter/material.dart';
import 'package:text_note/database/database.dart';
import 'package:text_note/model/notemodel.dart';
import 'package:text_note/pages/newnote.dart';

class Home extends StatefulWidget {
  static final Route = '0';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Databasse helper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper = Databasse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Note'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: helper.allnotes(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  Note_Model not = Note_Model.fromMap(snapshot.data[i]);
                  return Card(
                    child: ListTile(
                      title: Text('${not.title}'),
                      subtitle: Text(not.content),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                             helper.delete(not.id);
                          });

                        },
                      ),
                    ),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Newnote(),
              ))),
    );
  }
}
