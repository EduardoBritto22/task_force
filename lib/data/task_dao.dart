import 'package:sqflite/sqflite.dart';
import 'package:task_force/components/task.dart';
import 'package:task_force/data/database.dart';

class TaskDao {
  static const String _tablename = 'taskTable';

  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  saveOrUpdate(Task task) async {
    final Database db = await getDatabase();
    var itemExists = await find(task.name);

    if (itemExists.isEmpty) {
      return await db.insert(_tablename, toMap(task));
    } else {
      return await db.update(_tablename, toMap(task),
          where: '$_name = ?', whereArgs: [task.name]);
    }
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  Future<List<Task>> find(String taskName) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tablename, where: '$_name = ?', whereArgs: [taskName]);
    return toList(result);
  }

  delete(String taskName) async {
    final Database db = await getDatabase();
    await db.delete(_tablename, where: '$_name = ?', whereArgs: [taskName]);
  }

  // Mapper methods -----------------------------------------------------------------

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> tasksMap = {};
    tasksMap[_name] = task.name;
    tasksMap[_difficulty] = task.difficulty;
    tasksMap[_image] = task.image;

    return tasksMap;
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    final List<Task> tasks = [];
    for (var row in taskMap) {
      final Task task = Task(row[_name], row[_image], row[_difficulty]);
      tasks.add(task);
    }

    return tasks;
  }
}
