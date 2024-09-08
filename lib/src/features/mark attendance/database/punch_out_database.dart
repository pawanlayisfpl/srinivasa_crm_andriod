import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../domain/domain.dart';

class PunchoutPostDatabase {
  static final PunchoutPostDatabase _instance = PunchoutPostDatabase._internal();
  factory PunchoutPostDatabase() => _instance;
  static Database? _database;

  PunchoutPostDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'punch_out_post_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE punch_out_post(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        latitude TEXT,
        longitude TEXT
      )
    ''');
  }

  Future<int> insertPunchoutPost(PunchoutPostModel punchoutPost) async {
    final db = await database;
    int id = await db.insert(
      'punch_out_post',
      punchoutPost.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<List<PunchoutPostModel>> getAllPunchoutPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('punch_out_post');

    return List.generate(maps.length, (i) {
      return PunchoutPostModel.fromJson(maps[i]);
    });
  }

  Future<void> deleteAllPunchoutPosts() async {
    final db = await database;
    await db.delete('punch_out_post');
  }
}