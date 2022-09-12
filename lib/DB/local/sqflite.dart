

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DataBasesLocal {
Future<Database> initializeDB() async {
  String path = await getDatabasesPath();
  return openDatabase(
    join(path, 'DT_database.db'),
    onCreate: (database, version) async {
      await database.execute(
        'CREATE TABLE Users( idUser TEXT,  name TEXT,  img TEXT, email TEXT , pass TEXT)',

      );
      await database.execute(
        'CREATE TABLE TaskDatetime(id INTEGER PRIMARY KEY  ,  y INTEGER  ,  m INTEGER,  d INTEGER)',

      );
      await database.execute(
        'CREATE TABLE Tasks(id INTEGER PRIMARY KEY,  idUser TEXT  ,title TEXT,  subtitle TEXT  ,  y INTEGER  ,m INTEGER,d INTEGER)',

      );
      await database.execute(
        'CREATE TABLE TasksTar(  id INTEGER PRIMARY KEY  , idUser TEXT, titleTar TEXT, numTar TEXT)',

      );
      await database.execute(
        'CREATE TABLE Point(  idUser TEXT  , tasksPo INTEGER,  workPo INTEGER  ,  personPo INTEGER  ,  studyPo INTEGER  ,  anotherOP INTEGER  ,  notDone INTEGER )',

      );
    },
    version: 2,
  );
}
}
