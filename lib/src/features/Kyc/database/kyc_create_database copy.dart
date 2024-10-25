import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../domain/model/post/kyc_upload_post_model.dart';


class KycCrateDatabase {
  static final KycCrateDatabase _instance = KycCrateDatabase._internal();
  factory KycCrateDatabase() => _instance;
  static Database? _database;

  KycCrateDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'kyc_crate.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE kyc_upload_post (
        customerId TEXT PRIMARY KEY,
        aadharid TEXT,
        panCardId TEXT,
        gstInNo TEXT,
        panCardFile BLOB,
        aadharFile BLOB,
        aadharFileBack BLOB,
        gstInFile BLOB,
        remarks TEXT
      )
    ''');
  }

  Future<void> insertKycUploadPost(KycUploadPostModel kyc) async {
    final db = await database;
    await db.insert(
      'kyc_upload_post',
      kyc.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteKycUploadPost(String customerId) async {
    final db = await database;
    await db.delete(
      'kyc_upload_post',
      where: 'customerId = ?',
      whereArgs: [customerId],
    );
  }

  Future<List<KycUploadPostModel>> getKycUploadPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('kyc_upload_post');

    return List.generate(maps.length, (i) {
      return KycUploadPostModel.fromJson(maps[i]);
    });
  }
}