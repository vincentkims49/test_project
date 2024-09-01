import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CacheManager {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = "${directory.path}/item.db";

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE items(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  static Future<void> clearCache() async {
    final db = await database;
    db.delete('items');
  }
}
