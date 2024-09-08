import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../domain/model/get/alert_response_model.dart';

class AlertDatabase {
  static final AlertDatabase _instance = AlertDatabase._internal();
  factory AlertDatabase() => _instance;
  static Database? _database;

  AlertDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'alert_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE alert (
        notificationId INTEGER PRIMARY KEY AUTOINCREMENT,
        monthlyPlanId INTEGER,
        dailyPlanId INTEGER,
        read INTEGER,
        message TEXT,
        createdDate TEXT,
        notifyTo INTEGER,
        createdBy INTEGER,
        type TEXT,
        isDailyPlan INTEGER,
        monthlyPlanStatus TEXT,
        notificationType TEXT,
        notificationTypeId INTEGER
      )
    ''');
  }

 Future<int> insertAlert(AlertModel alert) async {
    final db = await database;
    int id = await db.insert(
      'alert',
      alert.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  
 Future<List<AlertModel>> getAllAlerts() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('alert');

    return List.generate(maps.length, (i) {
      return AlertModel.fromSqfliteJson(maps[i]);
    });
  }

  

  Future<void> deleteAllAlerts() async {
  final db = await database;
  await db.delete(
    'alert', // Table name
  );
}

  
}