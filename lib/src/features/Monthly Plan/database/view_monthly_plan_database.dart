import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/model/view_monthly_plan_model.dart';

class ViewMonthlyPlanDatabase {
  static final ViewMonthlyPlanDatabase _instance = ViewMonthlyPlanDatabase._internal();
  factory ViewMonthlyPlanDatabase() => _instance;
  static Database? _database;

  ViewMonthlyPlanDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'view_monthly_plan_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE view_monthly_plan(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        monthlyPlanId INTEGER,
        user TEXT,
        approvalStatus TEXT,
        comments TEXT,
        dailyPlans TEXT
      )
    ''');
  }

  Future<int> insertViewMonthlyPlan(ViewMonthlyPlanModel viewMonthlyPlan) async {
    final db = await database;
    int id = await db.insert(
      'view_monthly_plan',
      {
        'monthlyPlanId': viewMonthlyPlan.monthlyPlanId,
        'user': viewMonthlyPlan.user != null ? jsonEncode(viewMonthlyPlan.user!.toJson()) : null,
        'approvalStatus': viewMonthlyPlan.approvalStatus,
        'comments': viewMonthlyPlan.comments,
        'dailyPlans': viewMonthlyPlan.dailyPlans != null ? jsonEncode(viewMonthlyPlan.dailyPlans!.map((v) => v.toJson()).toList()) : null,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }


Future<ViewMonthlyPlanModel?> getViewMonthlyPlanByMonthlyPlanId(int monthlyPlanId) async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'view_monthly_plan',
    where: 'monthlyPlanId = ?',
    whereArgs: [monthlyPlanId],
    limit: 1, // Ensure only one record is fetched
  );

  if (maps.isNotEmpty) {
    final map = Map<String, dynamic>.from(maps.first); // Ensure the map is mutable
    map['user'] = map['user'] != null ? jsonDecode(map['user']) : null;
    map['dailyPlans'] = map['dailyPlans'] != null ? List<Map<String, dynamic>>.from(jsonDecode(map['dailyPlans'])) : null;
    return ViewMonthlyPlanModel.fromJson(map);
  } else {
    return null; // Return null if no record is found
  }
}

  Future<void> deleteViewMonthlyPlansByMonthlyPlanId(int monthlyPlanId) async {
    final db = await database;
    await db.delete(
      'view_monthly_plan',
      where: 'monthlyPlanId = ?',
      whereArgs: [monthlyPlanId],
    );
  }
}
