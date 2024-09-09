import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/model/post/checkout_post_model.dart';

class CheckoutPostDatabase {
  static final CheckoutPostDatabase _instance = CheckoutPostDatabase._internal();
  factory CheckoutPostDatabase() => _instance;
  static Database? _database;

  CheckoutPostDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'checkout_posts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
Future<void> _onCreate(Database db, int version) async {
  await db.execute('''
    CREATE TABLE checkout_post (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      images BLOB,
      files BLOB,
      userIds TEXT,
      purposeId TEXT,
      customerName TEXT,
      langitude TEXT,
      latitude TEXT,
      remarks TEXT,
      farmId TEXT,
      customerId TEXT,
       created_at TEXT
    )
  ''');
}

Uint8List serializeUint8ListList(List<Uint8List> list) {
  final buffer = BytesBuilder();
  for (var uint8List in list) {
    final length = uint8List.length;
    buffer.addByte(length >> 24);
    buffer.addByte(length >> 16);
    buffer.addByte(length >> 8);
    buffer.addByte(length);
    buffer.add(uint8List);
  }
  return buffer.toBytes();
}

List<Uint8List> deserializeUint8ListList(Uint8List data) {
  final list = <Uint8List>[];
  var offset = 0;
  while (offset < data.length) {
    final length = (data[offset] << 24) |
                   (data[offset + 1] << 16) |
                   (data[offset + 2] << 8) |
                   data[offset + 3];
    offset += 4;
    list.add(Uint8List.sublistView(data, offset, offset + length));
    offset += length;
  }
  return list;
}

  Future<int> insertCheckoutPost(CheckoutPostModel model) async {
    final db = await database;

    Uint8List? serializedImages;
    Uint8List? serializedFiles;

    if (model.images != null) {
      serializedImages = serializeUint8ListList(model.images!);
    }

    if (model.files != null) {
      serializedFiles = serializeUint8ListList(model.files!);
    }

    final data = model.toDatabasJson();
    data['images'] = serializedImages;
    data['files'] = serializedFiles;

    return await db.insert('checkout_post', data);
  }
  
  Future<List<CheckoutPostModel>> getCheckoutPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('checkout_post');

    return List.generate(maps.length, (i) {
      List<Uint8List>? images;
      List<Uint8List>? files;

      if (maps[i]['images'] != null) {
        images = deserializeUint8ListList(maps[i]['images']);
      }

      if (maps[i]['files'] != null) {
        files = deserializeUint8ListList(maps[i]['files']);
      }

      return CheckoutPostModel(
        images: images,
        files: files,
        userIds: (maps[i]['userIds'] as String).split(',').map((e) => int.parse(e)).toList(),
        purposeId: maps[i]['purposeId'],
        customerName: maps[i]['customerName'],
        langitude: maps[i]['langitude'],
        latitude: maps[i]['latitude'],
        remarks: maps[i]['remarks'],
        farmId: maps[i]['farmId'],
        customerId: maps[i]['customerId'],
        createdAt: DateTime.parse(maps[i]['created_at']),
      );
    });
  }

  Future<int> updateCheckoutPost(CheckoutPostModel model) async {
    final db = await database;
    return await db.update(
      'checkout_post',
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.customerId],
    );
  }

  Future<int> deleteCheckoutPost(int id) async {
    final db = await database;
    return await db.delete(
      'checkout_post',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  
  Future<void> deleteAllCheckoutPost() async {
    final db = await database;
    await db.delete('checkout_post');
  }
}