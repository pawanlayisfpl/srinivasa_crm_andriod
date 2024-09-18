import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/models/punch_in_post_model.dart';

class PunchInPostDatabase {
  static final PunchInPostDatabase _instance = PunchInPostDatabase._internal();
  factory PunchInPostDatabase() => _instance;
  static Database? _database;

  PunchInPostDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'new_punch_in_post_database.db');
    return await openDatabase(
      path,
      version: 1, // Set the version to 1
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE punch_in_post(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        latitude TEXT,
        longitude TEXT,
        createdAt TEXT
      )
    ''');
  }

  Future<int> insertPunchInPost(PunchInPostModel punchInPost) async {
    final db = await database;
    int id = await db.insert(
      'punch_in_post',
      punchInPost.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<List<PunchInPostModel>> getAllPunchInPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('punch_in_post');

    return List.generate(maps.length, (i) {
      return PunchInPostModel.fromJson(maps[i]);
    });
  }

  Future<PunchInPostModel?> getPunchInPost() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('punch_in_post', limit: 1);

    if (maps.isNotEmpty) {
      return PunchInPostModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<void> deletePunchInPost() async {
    final db = await database;
    await db.delete('punch_in_post');
  }
}