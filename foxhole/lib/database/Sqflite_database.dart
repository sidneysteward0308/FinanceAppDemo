
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDatabase {
  static final SqfliteDatabase instance = SqfliteDatabase._init();
  static Database? _database;

  SqfliteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('foxhole.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // User Table
    await db.execute('''
    CREATE TABLE user (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL,
      password TEXT NOT NULL
    )
    ''');

    // Transactions Table
    await db.execute('''
    CREATE TABLE transactions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      amount REAL NOT NULL,
      type TEXT NOT NULL,
      date TEXT NOT NULL
    )
    ''');

    // Linked Institutions Table
    await db.execute('''
    CREATE TABLE institutions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      accountNumber TEXT NOT NULL,
      routingNumber TEXT NOT NULL,
      type TEXT NOT NULL
    )
    ''');
  }

   //checks for if account is already in db
  Future<bool> checkAccountExists(String email) async {
    final db = await instance.database;
    final result =
        await db.query('user', where: 'username = ?', whereArgs: [email]);
    return result.isNotEmpty;
  }


  // CRUD Operations for User
  Future<int> createUser(String username, String password) async {
    final db = await instance.database;
    final id = await db.insert('user', {'username': username, 'password': password});
    return id;
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    final db = await instance.database;
    final result = await db.query('user', where: 'username = ? AND password = ?', whereArgs: [username, password]);
    return result.isNotEmpty ? result.first : null;
  }

  // CRUD Operations for Transactions
  Future<int> createTransaction(double amount, String type, String date) async {
    final db = await instance.database;
    final id = await db.insert('transactions', {'amount': amount, 'type': type, 'date': date});
    return id;
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    final db = await instance.database;
    return await db.query('transactions', orderBy: 'date DESC');
  }

  // CRUD Operations for Institutions
  Future<int> addInstitution(String name, String accountNumber, String routingNumber, String type) async {
  final db = await instance.database;
  final id = await db.insert('institutions', {
    'name': name,
    'accountNumber': accountNumber,
    'routingNumber': routingNumber,
    'type': type,
  });
  return id;
}

  Future<List<Map<String, dynamic>>> getInstitutions() async {
    final db = await instance.database;
    return await db.query('institutions', orderBy: 'name ASC');
  }
Future close() async {
  final db = SqfliteDatabase._database;
  if (db != null) {
    await db.close();
    _database = null; 
  }
}

}
