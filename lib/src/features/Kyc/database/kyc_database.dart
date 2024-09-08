import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../domain/model/customer_kyu_model.dart';


class KycDatabase {
  static final KycDatabase _instance = KycDatabase._internal();
  factory KycDatabase() => _instance;
  static Database? _database;

  KycDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'customer_kyc.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE customer_kyc (
        customerId TEXT PRIMARY KEY,
        customerName TEXT,
        kycStatus TEXT
      )
    ''');
  }

  Future<void> insertCustomerKyc(CustomerKycModel customer) async {
    final db = await database;
    await db.insert(
      'customer_kyc',
      customer.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteCustomerKyc(String customerId) async {
    final db = await database;
    await db.delete(
      'customer_kyc',
      where: 'customerId = ?',
      whereArgs: [customerId],
    );
  }

  Future<List<CustomerKycModel>> getCustomerKycs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('customer_kyc');

    return List.generate(maps.length, (i) {
      return CustomerKycModel.fromJson(maps[i]);
    });
  }
}