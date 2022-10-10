import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:todo/DB/local/crad.dart';

import '../DB/local/sqflite.dart';
import '../model/sql_model/tar_tasks.dart';

class TargetController extends GetxController {
  CradDB db = CradDB();
  DataBasesLocal dataBasesLocal =DataBasesLocal();
String? newTitle;

  Future<List<TargetTasksModel>>  readTarget() async {
    final db = await  dataBasesLocal.initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('TargetTasks');
    return queryResult.map((e) =>  TargetTasksModel.fromMap(e)).toList();
  }
  Future<void> updateTarget(  TargetTasksModel targetTasksModel) async {
    // Get a reference to the database.
    final db = await   dataBasesLocal.initializeDB();

    // Update the given Dog.
    await db.update(
      'TargetTasks',
      targetTasksModel.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a wshereArg to prevent SQL injection.
      whereArgs: [targetTasksModel.id],
    );
  }


 Future<List<TargetTasksModel>>? targetDb;
DateTime dateTime=DateTime.now() ;

  //add target
  String weekActive = 'w1';

  List<String> week = ['w1', 'w2', 'w3', 'w4'];


  int id=0;
  int newID() {
    readTarget().asStream().listen((event) {
      event.isNotEmpty?
      id = event.last.id:
          id=1;
    });
    print(id);

    return id + 1;
  }

  addTarget() async {
    await db.insert(
        'TargetTasks', TargetTasksModel(newID(), newTitle!, weekNun(weekActive),dateTime.year,dateTime.month));
    targetDb!.then((value) => value.add(TargetTasksModel(newID(), newTitle!,  weekNun(weekActive),dateTime.year,dateTime.month)));
    update();
  }

 String weekNunToString(int weekNun){
    String value='';


    switch(weekNun) {
      case 1: { value='w1'; }
      break;

      case 2: { value='w2'; }
      break;

      case 3: {  value='w3'; }
      break;

      case 4: { value='w4'; }
      break;

      default: { print("Invalid choice"); }
      break;
    }
    return value;
  }
  weekChanged(int index,weekNun){


    targetDb!.then((value) {
      value[index] = TargetTasksModel(
          value[index].id, value[index].titleTar, weekNun, value[index].y,
          value[index].m);
      updateTarget(TargetTasksModel(  value[index].id,  value[index].titleTar, weekNun, value[index].y, value[index].m));

    }
    );


    update();
  }

 int weekNun(String e){
 return  e=='w1'?1:
   e=='w2'?2:
   e=='w3'?3:
   e=='w4'?4:0;
  }
  @override
  void onInit() {
    targetDb =  readTarget();
    super.onInit();
  }
}
