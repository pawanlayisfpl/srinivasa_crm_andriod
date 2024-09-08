import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../domain/model/post/monthly_plan_post_model.dart';


class CreateMonthlyPlanPostDatabase {
  static final CreateMonthlyPlanPostDatabase _instance = CreateMonthlyPlanPostDatabase._internal();
  factory CreateMonthlyPlanPostDatabase() => _instance;
  static Database? _database;

  CreateMonthlyPlanPostDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'monthly_plan_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE monthly_plan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        planStartDate TEXT,
        planEndDate TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE daily_plan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        createdDate TEXT,
        approxKms REAL,
        monthlyPlanId INTEGER,
        FOREIGN KEY (monthlyPlanId) REFERENCES monthly_plan (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE farm_ids (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        farmId INTEGER,
        dailyPlanId INTEGER,
        FOREIGN KEY (dailyPlanId) REFERENCES daily_plan (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<int> insertMonthlyPlan(CreateMonthlyPlanPostModel monthlyPlan) async {
    final db = await database;

    int monthlyPlanId = await db.insert(
      'monthly_plan',
      {
        'planStartDate': monthlyPlan.planStartDate,
        'planEndDate': monthlyPlan.planEndDate,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (var dailyPlan in monthlyPlan.dailyPlans) {
      int dailyPlanId = await db.insert(
        'daily_plan',
        {
          'createdDate': dailyPlan.createdDate,
          'approxKms': dailyPlan.approxKms,
          'monthlyPlanId': monthlyPlanId,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      for (var farmId in dailyPlan.farmIds) {
        await db.insert(
          'farm_ids',
          {
            'farmId': farmId,
            'dailyPlanId': dailyPlanId,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }

    return monthlyPlanId;
  }

  Future<CreateMonthlyPlanPostModel?> getMonthlyPlan(int id) async {
    final db = await database;

    final List<Map<String, dynamic>> monthlyPlanMaps = await db.query(
      'monthly_plan',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (monthlyPlanMaps.isNotEmpty) {
      final monthlyPlanMap = monthlyPlanMaps.first;

      final List<Map<String, dynamic>> dailyPlanMaps = await db.query(
        'daily_plan',
        where: 'monthlyPlanId = ?',
        whereArgs: [id],
      );

      List<DailyPlanPostModel> dailyPlans = [];

      for (var dailyPlanMap in dailyPlanMaps) {
        final List<Map<String, dynamic>> farmIdMaps = await db.query(
          'farm_ids',
          where: 'dailyPlanId = ?',
          whereArgs: [dailyPlanMap['id']],
        );

        List<int> farmIds = farmIdMaps.map((farmIdMap) => farmIdMap['farmId'] as int).toList();

        dailyPlans.add(DailyPlanPostModel(
          createdDate: dailyPlanMap['createdDate'],
          farmIds: farmIds,
          approxKms: dailyPlanMap['approxKms'],
        ));
      }

      return CreateMonthlyPlanPostModel(
        planStartDate: monthlyPlanMap['planStartDate'],
        planEndDate: monthlyPlanMap['planEndDate'],
        dailyPlans: dailyPlans,
      );
    } else {
      return null;
    }
  }

  Future<void> deleteMonthlyPlan(int id) async {
    final db = await database;
    await db.delete(
      'monthly_plan',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}