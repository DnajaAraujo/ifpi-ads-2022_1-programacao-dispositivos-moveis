import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper {

  static const _databaseName = 'ExemploDB.db';
  static const _databaseVersion = 1;

  static const table = 'liked_posts';
  static const columnId = '_id';
  static const columnLike = 'like';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnLike INTEGER NOT NULL
      )
      '''
    );
  }

  // Helper methods ...
  Future<void> insert(int id, int like) async {
    Database db = await instance.database;
    await db.rawInsert(
      'INSERT INTO $table($columnId, $columnLike) VALUES(?, ?)',
      [id, like]
    );
  }

  Future<void> update(int id, int like) async {
    Database db = await instance.database;
    await db.rawUpdate(
      'UPDATE $table SET $columnLike = ? WHERE $columnId = ?',
      [like, id]
    );
  }

  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
      await db.rawQuery(
        'SELECT COUNT(*) FROM $table'
      )
    );
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int?> queryLikeById(int id) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
      await db.rawQuery(
        'SELECT $columnLike FROM $table WHERE $columnId = ?',
        [id]
      )
    );
  }

  Future<void> delete() async {
    Database db = await instance.database;
    await db.rawDelete(
      'DELETE FROM $table'
    );
  }

}