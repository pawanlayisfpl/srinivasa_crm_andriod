import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OfflineLocationDatabaseHelper {
  static final OfflineLocationDatabaseHelper instance = OfflineLocationDatabaseHelper._init();
  static Database? _database;

  OfflineLocationDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('ioslocations.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE locations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        latitude REAL,
        longitude REAL,
        userDateTime TEXT,
        batteryStatus TEXT
      )
    ''');
  }

  Future<int> insertLocation(Map<String, dynamic> location) async {
    final db = await instance.database;
    return await db.insert('locations', location);
  }

  Future<List<Map<String, dynamic>>> fetchAllLocations() async {
    final db = await instance.database;
    return await db.query('locations');
  }

  Future<int> deleteAllLocations() async {
    final db = await instance.database;
    return await db.delete('locations');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
