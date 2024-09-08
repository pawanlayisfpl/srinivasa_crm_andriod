import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/models/login_post_model.dart';

class LoginPostDatabase {
  static final LoginPostDatabase _instance = LoginPostDatabase._internal();
  factory LoginPostDatabase() => _instance;
  static Database? _database;

  LoginPostDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'login_post_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE login_post(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<int> insertLoginPost(LoginPostModel loginPost) async {
  final db = await database;
  int id = await db.insert(
    'login_post',
    loginPost.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return id;
}

  Future<LoginPostModel?> getLoginPost() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('login_post', limit: 1);

    if (maps.isNotEmpty) {
      return LoginPostModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<void> deleteLoginPost() async {
    final db = await database;
    await db.delete('login_post');
  }
}