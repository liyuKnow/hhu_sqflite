import 'package:hhu_sqflite/src/data/models/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

abstract class DBHelper {
  static Database? _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      var databasePath = await getDatabasesPath();

      String _path = p.join(databasePath, 'hhu_helper');

      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: onCreate,
        onUpgrade: onUpgrade,
      );
    } catch (e) {}
  }

  // THIS RENDERS ONLY ONCE AT CREATION OF DB WHEN IT DIDN'T EXIST
  static void onCreate(Database db, int version) async {
    String createTablesQuery = '''
      CREATE TABLE readings(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        customerName TEXT,
        customerId TEXT,
        deviceId TEXT,
        status INTEGER,
        meterReading REAL,
        status INTEGER DEFAULT 0,
        hasPhoto INTEGER,
        fieldPhot VARCHAR,
        readingDate VARCHAR
      );
      ''';

    await db.execute(createTablesQuery);
  }

  static void onUpgrade(Database db, int oldVersion, int version) async {
    if (oldVersion > version) {
      // if version changes the ff command will  be executed
    }
  }

  // Return a list
  static Future<List<Map<String, dynamic>>> query(String table) async {
    return await _db!.query(table);
    // return _db!.query(table);
  }

  static Future<int> insert(String table, Model model) async {
    return await _db!.insert(
      table,
      model.toJson(),
    );
  }

  static Future<int> update(String table, Model model) async {
    return await _db!.update(
      table,
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  static Future<int> delete(String table, Model model) async {
    return await _db!.delete(
      table,
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }
}
