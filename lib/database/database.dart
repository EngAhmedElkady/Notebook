import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:text_note/model/notemodel.dart';
import 'package:text_note/pages/newnote.dart';

class Databasse {
  //to make the class one when greate anew class don't take anothe object;
  static final Databasse _instance = Databasse.init();
  factory Databasse() => _instance;
  Databasse.init();

  // database
  static Database _db;
  /**
    
     * creat database
     * insert to databse
     * return all note in database
     * delete from databse
     
  */

  // 1-> great database
  Future<Database> createdatabase() async {
    if (_db != null)
      return _db;
    else {
      String path = join(await getDatabasesPath(), 'Story');
      _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
        db.execute(
            "create table Note( id integer primary key autoincrement, title varchar(50), content varchar(1000))");
      });

      return _db;
    }
  }

  // 2->creat insert
  Future<int> creat_note(Note_Model note) async {
    Database db = await createdatabase();
    return db.insert('Note', note.tomap()); // return the id of the table in the date base
  }

  // 3->return the all notes in the adata base
  Future<List> allnotes() async {
    Database db = await createdatabase();
    return db.query('Note');
  }

  // 4-> delete the course;
  Future<int> delete(int id) async {
    Database db = await createdatabase();
    return db.delete('Note', where: 'id = ?', whereArgs: [id]); //return nuber the delete not
  }
}
