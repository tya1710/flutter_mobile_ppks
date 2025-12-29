import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/panen_model.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("panen.db");
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute("""
      CREATE TABLE panen (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tanggal TEXT NOT NULL,
        berat REAL NOT NULL,
        harga REAL NOT NULL,
        upah REAL NOT NULL
      )
    """);
  }

  Future<int> insertPanen(Panen panen) async {
    final db = await instance.database;
    return await db.insert("panen", panen.toMap());
  }

  Future<List<Panen>> getAllPanen() async {
    final db = await instance.database;
    final result = await db.query("panen");
    return result.map((e) => Panen.fromMap(e)).toList();
  }
}
