import 'package:sqflite/sqflite.dart';
import 'package:todo/DB/local/sqflite.dart';
import 'package:todo/model/sql_model/Tasks.dart';
import 'package:todo/model/sql_model/users.dart';

import '../../model/sql_model/point.dart';

class CradDB {

  DataBasesLocal dataBasesLocal =DataBasesLocal();
  Future<void> insert(String NameDB,  Model) async {
    final db = await   dataBasesLocal.initializeDB();

    await db.insert(
      NameDB,
      Model.toMap(),
conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

   reads(String NameDB ,dynamic ad) async {
    // Get a reference to the database.
    final db = await   dataBasesLocal.initializeDB();

    final List<Map<String, dynamic>> queryResult = await db.query(NameDB);

    return queryResult.map((e) =>  ad(e)).toList();
  }

  Future<void> update( String NameDB, DailyTasksModel) async {
    // Get a reference to the database.
    final db = await   dataBasesLocal.initializeDB();

    // Update the given Dog.
    await db.update(
      NameDB,
      DailyTasksModel.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a wshereArg to prevent SQL injection.
      whereArgs: [DailyTasksModel.id],
    );
  }

  Future<void> delete(String NameDB,int id) async {
    // Get a reference to the database.
    final db = await   dataBasesLocal.initializeDB();

    // Remove the Dog from the database.
    await db.delete(
      NameDB,
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

}