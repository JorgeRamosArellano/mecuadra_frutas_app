import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

class SqlDB {
  static String _pathDB = '';
  static late Database _db;
  static const String _tableName = 'fruits';

  static Future<dynamic> initDB() async {
    String pathDBLocation = await getDatabasesPath();
    _pathDB = join(pathDBLocation, 'fruits2.db');
    print('_pathDB: $_pathDB');
    _db = await openDatabase(
      _pathDB,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, name TEXT)''');
      },
    );
    print('DB OPENED');
  }
  

  static Future<bool> insertFruit(Map<String, dynamic> data) async {
    try {
      print('INSERT');
      final result = await _db.insert(_tableName, data);
      print('INSERT result: $result');
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<List<Map<String, dynamic>>> getFruits() async {
    try {
      print('GET ALL DATA');
      final data = await _db.query(_tableName);
      print({'ALL_DATA': data});
      return data;
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deleteFruit({required int id}) async {
    try {
      await _db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateFruit({required Map<String, dynamic> data}) async {
    try {
      await _db.update(_tableName, data, where: 'id = ?', whereArgs: [data['id']]);
      return true;
    } catch (e) {
      return false;
    }
  }
}
