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

  save(Task task) async {}

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  Future<List<Task>> find(String taskName) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename, where: '$_name = ?',whereArgs: [taskName]);
    return toList(result);
  }

  delete(String taskName) async {}

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    final List<Task> tasks = List.empty();
    for (var row in taskMap) {
      final Task task = Task(row[_name], row[_image], row[_difficulty]);
      tasks.add(task);
    }

    return tasks;
  }
}
