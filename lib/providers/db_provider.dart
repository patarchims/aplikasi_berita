import 'dart:io';
import 'package:berita_app/models/iklan_web_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  late Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    _database = await initDB();
    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'iklan_manager.db');

// return await db.execute('''
//       CREATE TABLE $table (
//         $columnId INTEGER PRIMARY KEY,
//         $columnfid VARCHAR,
//         $columnfname TEXT
//       )
//       ''');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Iklan (id INTEGER PRIMARY KEY, link TEXT, gambar TEXT, kategori INTEGER)');
    });
  }

  // Insert employee on database
  createIklan(IklanWeb iklan) async {
    await deleteIklan();
    final db = await database;
    final res = await db.insert('Iklan', iklan.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteIklan() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Iklan');

    return res;
  }

  Future<List<IklanWeb>> getAllIklan() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Iklan");

    List<IklanWeb> list =
        res.isNotEmpty ? res.map((c) => IklanWeb.fromJson(c)).toList() : [];

    return list;
  }
}
