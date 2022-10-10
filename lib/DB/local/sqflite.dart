

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DataBasesLocal {
Future<Database> initializeDB() async {
  String path = await getDatabasesPath();
  return openDatabase(
    join(path, 'DT_database.db'),
    onCreate: (database, version) async {
      await database.execute(
        'CREATE TABLE NoteTask(  id INTEGER PRIMARY KEY,  title TEXT  ,  y INTEGER  ,  m INTEGER  ,  d INTEGER    )',

      );
      await database.execute(
        'CREATE TABLE Users( idUser TEXT,  name TEXT,  img TEXT, email TEXT , pass TEXT)',

      );
      await database.execute(
        'CREATE TABLE TaskDatetime(id INTEGER PRIMARY KEY  ,  y INTEGER  ,  m INTEGER,  d INTEGER)',

      );
      await database.execute(
        'CREATE TABLE Tasks(id INTEGER PRIMARY KEY,  idUser TEXT ,  isDone INTEGER  ,  title TEXT,  subtitle TEXT  ,  y INTEGER  ,m INTEGER,d INTEGER)',

      );


      await database.execute(
        'CREATE TABLE TargetTasks(  id INTEGER PRIMARY KEY , titleTar TEXT, weekNun INTEGER, y INTEGER, m INTEGER)',

      );
      await database.execute(
        'CREATE TABLE Achievements(  id INTEGER PRIMARY KEY , title TEXT, point INTEGER, y INTEGER, m INTEGER)',

      );
      await database.execute(
        'CREATE TABLE Trophies(  id INTEGER PRIMARY KEY , title TEXT, nun INTEGER, y INTEGER, m INTEGER)',

      );
      await database.execute(
        'CREATE TABLE Point(  tasksPo INTEGER,  workPo INTEGER  ,  personPo INTEGER  ,  studyPo INTEGER  ,  anotherOP INTEGER  ,  notDone INTEGER )',

      );

    },
    version: 2,
  );
}
}
