import 'dart:async';
import 'dart:convert'; // Import for JSON encoding and decoding
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../domain/model/get/customer_response_model.dart';

@singleton
class CustomerDataBaseHelper {
  static final CustomerDataBaseHelper _instance = CustomerDataBaseHelper._internal();
  factory CustomerDataBaseHelper() => _instance;
  static Database? _database;

  CustomerDataBaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'customer_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE customers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data TEXT
      )
    ''');
  }

  Future<CustomerResponseModel> insertCustomerResponse(CustomerResponseModel response) async {
    final db = await database;
    int id = await db.insert(
      'customers',
      {'data': jsonEncode(response.toJson())}, // Store JSON string
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // Retrieve the inserted row
    final List<Map<String, dynamic>> maps = await db.query(
      'customers',
      where: 'id = ?',
      whereArgs: [id],
    );

    // Return the CustomerResponseModel object
    if (maps.isNotEmpty) {
      return CustomerResponseModel.fromJson(jsonDecode(maps.first['data']));
    } else {
      throw Exception('Failed to insert customer response');
    }
  }

  Future<List<CustomerResponseModel>> getCustomerResponses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('customers');

    return List.generate(maps.length, (i) {
      return CustomerResponseModel.fromJson(jsonDecode(maps[i]['data'])); // Parse JSON string
    });
  }

  Future<void> deleteAllCustomerResponses() async {
    final db = await database;
    await db.delete('customers');
  }
}
