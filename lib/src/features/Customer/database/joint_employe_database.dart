import 'dart:async';
import 'dart:convert'; // Import for JSON encoding and decoding
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/model/get/joint_employe_model.dart';

class JointEmployeDatabase {
  static final JointEmployeDatabase _instance = JointEmployeDatabase._internal();
  factory JointEmployeDatabase() => _instance;
  static Database? _database;

  JointEmployeDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'joint_employe_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE joint_employes(
        id INTEGER PRIMARY KEY,
        userName TEXT,
        designation TEXT
      )
    ''');
  }

  Future<void> insertJoinEmploye(JoinEmployeModel employe) async {
    final db = await database;
    await db.insert(
      'joint_employes',
      {
        'id': employe.id,
        'userName': employe.userName,
        'designation': jsonEncode(employe.designation), // Store JSON string
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<JoinEmployeModel>> getJoinEmployes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('joint_employes');

    return List.generate(maps.length, (i) {
      return JoinEmployeModel(
        id: maps[i]['id'],
        userName: maps[i]['userName'],
        designation: List<String>.from(jsonDecode(maps[i]['designation'])), // Parse JSON string
      );
    });
  }

  Future<void> deleteAllJoinEmployes() async {
    final db = await database;
    await db.delete('joint_employes');
  }
}