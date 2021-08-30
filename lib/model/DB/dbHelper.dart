import 'package:majoo_test/model/OrgDB/Org.dart';
import 'package:majoo_test/model/initalData/people.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
//mendukug pemrograman asinkron
import 'dart:io';
//bekerja pada file dan directory
import 'package:path_provider/path_provider.dart';
//pubspec.yml

//kelass Dbhelper
class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'org.db';

    //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return todoDatabase;
  }

  //buat tabel baru dengan nama contact
  void _createDb(Database db, int version) async {
    // await db.execute("DROP TABLE IF EXISTS org");
    await db.execute(
      '''CREATE TABLE org (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          height TEXT, 
          mass TEXT, 
          hair_color TEXT, 
          skin_color TEXT,
          eye_color TEXT,
          birth_year TEXT, 
          gender TEXT, 
          homeworld TEXT, 
          films TEXT, 
          species TEXT,
          vehicles TEXT,
          starships TEXT,
          fav TEXT,
          created TEXT,
          edited TEXT,
          url TEXT)''',
    );
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    } else {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select({String filter}) async {
    Database db = await this.database;
    var mapList;
    if (filter != "") {
      mapList = await db.query('org', orderBy: 'name', where: "fav = 'y'");
    } else {
      mapList = await db.query('org', orderBy: 'name');
    }
    return mapList;
  }

//create databases
  Future<int> insert({Poeple object, Org org}) async {
    int count;
    if (org == null) {
      Database db = await this.database;
      count = await db.insert('org', object.toStringData());
    } else {
      Database db = await this.database;
      count = await db.insert('org', org.toMap());
    }
    return count;
  }

//update databases
  Future<int> update({Poeple object, Org org}) async {
    Database db = await this.database;
    int count;
    if (org == null) {
      count = await db.update('org', object.toJson(),
          where: 'id=?', whereArgs: [object.id]);
    } else {
      count = await db
          .update('org', org.toMap(), where: 'id=?', whereArgs: [org.id]);
    }
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('org', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Org>> getOrgList({String filter}) async {
    var OrgMapList = await select(filter: filter != "" ? filter : "");
    int count = OrgMapList.length;
    List<Org> contactList = <Org>[];
    for (int i = 0; i < count; i++) {
      contactList.add(Org.fromMap(OrgMapList[i]));
    }
    return contactList;
  }
}
