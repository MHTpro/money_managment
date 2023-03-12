import 'package:money_managment/models/sql_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MainSql {
  MainSql.init();

  static MainSql instance = MainSql.init();
  static Database? _database;

  //delete database
  Future<void> deleteDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "databaseone");
    final db = databaseFactory.deleteDatabase(path);

    return db;
  }

  //get_database
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase("databaseone");
    return _database;
  }

  Future<Database> createDatabase(String dataBaseName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dataBaseName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
        const textType = 'TEXT NOT NULL';

        for (String tableName in listOfTableNames) {
          await db.execute(
            '''CREATE TABLE $tableName(
            ${SqlField.id} $idType,
            ${SqlField.title} $textType,
            ${SqlField.price} $textType,
            ${SqlField.description} $textType
          )''',
          );
        }
      },
    );
  }

  //getAll
  Future<List<SqlModels>> getAll(String table) async {
    final db = await MainSql.instance.database;
    final result = await db!.query(
      table,
    );

    return result.map((v) => SqlModels.fromJson(v)).toList();
  }

  //getOne
  Future<SqlModels> getOne(int? id, String table) async {
    final db = await MainSql.instance.database;
    final result = await db!.query(
      table,
      columns: SqlField.values,
      where: "${SqlField.id} = ?",
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return SqlModels.fromJson(result.first);
    } else {
      throw Exception("Can't show");
    }
  }

  //add
  Future<SqlModels> addInfo(SqlModels model, String table) async {
    final db = await MainSql.instance.database;
    final newId = await db!.insert(table, model.toJson());

    return model.copy(id: newId);
  }

  //update
  Future<int> editInfo(SqlModels model, String table) async {
    final db = await MainSql.instance.database;
    return await db!.update(
      table,
      model.toJson(),
      where: "${SqlField.id} = ?",
      whereArgs: [model.id],
    );
  }

  //delete
  Future<int> deleteInfo(int? id, String table) async {
    final db = await MainSql.instance.database;

    return await db!.delete(
      table,
      where: "${SqlField.id} = ?",
      whereArgs: [id],
    );
  }

  //close
  Future closeDatabase() async {
    final db = await MainSql.instance.database;
    db!.close();
  }
}
