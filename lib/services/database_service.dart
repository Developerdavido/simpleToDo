

import 'package:path/path.dart';
import 'package:simple_to_do/models/todo.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const toDoTable = "to_do_table";
  int? version = 1;

  Database? _database;

  Future<Database> get database  async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String? databasePath = await getDatabasesPath();
    String? path = join(databasePath, "todo_table.db");

    return await openDatabase(
        path,
      version: version,
      onCreate: (database, version) async {
          await database.execute(
            '''
            CREATE TABLE $toDoTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            item TEXT,
            uuid TEXT,
            description TEXT,
            created_at TEXT,
            completed INTEGER
            )
            '''
          );
      }

    );
  }

  //save a todo
  Future<int> saveTodo(ToDo todo) async {
    final db = await database;
    return await db.insert(toDoTable, todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //update an item
  Future<int> updateTodo(ToDo toDo) async {
    final db = await database;
    print(toDo.uuid);
    return await db.update(toDoTable, toDo.toJson(),
        where: 'uuid = ?', whereArgs: [toDo.uuid]);
  }


  //delete todo
  Future<int> deleteTodo({
    String? uuid,
  }) async {
    final db = await database;
    return await db.delete(toDoTable, where: 'uuid = ?', whereArgs: [uuid]);
  }

  //get all todo list
  Future<List<ToDo>> getTodoList() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(toDoTable);
    print(maps.toString());
    return List.generate(maps.length, (index) {
      return ToDo.fromJson(maps[index]);
    });
  }






}