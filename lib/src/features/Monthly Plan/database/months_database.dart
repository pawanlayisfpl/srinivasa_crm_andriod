import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/model/get/monthly_plan_months_model.dart';

class MonthlyPlanMonthsDatabase {
  static final MonthlyPlanMonthsDatabase _instance = MonthlyPlanMonthsDatabase._internal();
  factory MonthlyPlanMonthsDatabase() => _instance;
  static Database? _database;

  MonthlyPlanMonthsDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'monthly_plan_months_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE monthly_plan_months(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        month INTEGER,
        monthlyPlanId INTEGER
      )
    ''');
  }

  Future<int> insertMonthlyPlanMonth(MonthlyPlanMonthsModel monthlyPlanMonth) async {
    final db = await database;
    int id = await db.insert(
      'monthly_plan_months',
      monthlyPlanMonth.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<List<MonthlyPlanMonthsModel>> getAllMonthlyPlanMonths() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('monthly_plan_months');

    return List.generate(maps.length, (i) {
      return MonthlyPlanMonthsModel.fromJson(maps[i]);
    });
  }

  Future<void> deleteAllMonthlyPlanMonths() async {
    final db = await database;
    await db.delete('monthly_plan_months');
  }
}