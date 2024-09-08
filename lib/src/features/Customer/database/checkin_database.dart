import 'dart:async';
import 'dart:convert'; // Import for JSON encoding and decoding
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/model/post/checkin_post_model.dart';

class CheckinPostDatabase {
  static final CheckinPostDatabase _instance = CheckinPostDatabase._internal();
  factory CheckinPostDatabase() => _instance;
  static Database? _database;

  CheckinPostDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'checkin_post_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE checkin_posts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userIds TEXT,
        inTime TEXT,
        customerid INTEGER,
        customerName TEXT,
        langitude TEXT,
        latitude TEXT,
        remarks TEXT,
        farmId TEXT
      )
    ''');
  }

  Future<int> insertCheckinPost(CheckinPostModel checkinPost) async {
  final db = await database;
  int id = await db.insert(
    'checkin_posts',
    {
      'userIds': jsonEncode(checkinPost.userIds), // Store JSON string
      'inTime': checkinPost.inTime,
      'customerid': checkinPost.customerid,
      'customerName': checkinPost.customerName,
      'langitude': checkinPost.langitude,
      'latitude': checkinPost.latitude,
      'remarks': checkinPost.remarks,
      'farmId': checkinPost.farmId,
    },
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return id;
}

  Future<List<CheckinPostModel>> getCheckinPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('checkin_posts');

    return List.generate(maps.length, (i) {
      return CheckinPostModel(
        userIds: List<int>.from(jsonDecode(maps[i]['userIds'])), // Parse JSON string
        inTime: maps[i]['inTime'],
        customerid: maps[i]['customerid'],
        customerName: maps[i]['customerName'],
        langitude: maps[i]['langitude'],
        latitude: maps[i]['latitude'],
        remarks: maps[i]['remarks'],
        farmId: maps[i]['farmId'],
      );
    });
  }

  Future<void> deleteAllCheckinPosts() async {
    final db = await database;
    await db.delete('checkin_posts');
  }
}