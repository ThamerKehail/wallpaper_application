import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'thamer.db');
    Database myDb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return myDb;

    // return await openDatabase(
    //   '$path/favorites.db',
    //   version: 1,
    //   onCreate: (db, version) {
    //     return db.execute(
    //       'CREATE TABLE favorites(id INTEGER PRIMARY KEY, imageUrl TEXT)',
    //     );
    //   },
    // );
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      '''
    CREATE TABLE favorites(id INTEGER PRIMARY KEY, imageUrl TEXT)
    ''',
    );
    print("Create DataBase");
  }

  Future<int> insertFavorite(Map<String, dynamic> favorite) async {
    try {
      final db = await database;
      print("Success");
      return await db!.insert('favorites', favorite);
    } on Exception catch (e) {
      // Handle any other exceptions here
      print('Error: ${e.toString()}');
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await database;
    return await db!.query('favorites');
  }

  Future<int> deleteFavorite(int id) async {
    final db = await database;
    return await db!.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
}
