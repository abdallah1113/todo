
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/DB/local/crad.dart';
import 'package:todo/controller/target_controller.dart';
import 'package:todo/model/sql_model/note.dart';
import 'package:todo/model/sql_model/tar_tasks.dart';

import '../DB/local/sqflite.dart';
import '../model/sql_model/Tasks.dart';
import '../model/sql_model/task_datetime.dart';
import '../utils.dart';



class MainScreenController extends GetxController {
  DataBasesLocal dataBasesLocal =DataBasesLocal();


   Map<DateTime, List<TasksModel>> tasksDB = {
   } ;
  LinkedHashMap? kEvents ;
  int gettHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
  List<TasksModel>? allTasksInDB;
  List<TasksModel>?tasksForeOneDays=[];

  List<TaskDatetimeModel>? allTaskDateTimeInDB;


CradDB cradDB =CradDB();
 DateTime focusedDay = DateTime.now();
DateTime? selectedDay;
DateTime? rangeStart;
DateTime? rangeEnd;
DateTime startDate = DateTime(2022,1,1);
DateTime endDate =  DateTime(2024,1,1);

CalendarFormat calendarFormat = CalendarFormat.month;
RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOff;
late final ValueNotifier<List<TasksModel>> selectedEvents;




List<TasksModel> _getEventsForDay(DateTime day) {
  // Implementation example
  update();

  return  kEvents![day] ?? [];

}



  List<TasksModel> getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    update();

    return [

    for (final d in days) ..._getEventsForDay(d),

    ];

  }


  List<TasksModel> getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents![day] ?? [];
  }


CradDB db=CradDB();
DateTime date =DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);

    Future<void> onDaySelected(DateTime _selectedDay, DateTime _focusedDay) async {
      add();

    if (!isSameDay(selectedDay, _selectedDay)) {
     // selectedEvents.value.add(TasksModel(0,'','abdallah','hi2',1999,2,2));
       selectedDay = _selectedDay;
      focusedDay = _focusedDay;
     rangeStart = null; // Important to clean those
    rangeEnd = null;
     rangeSelectionMode = RangeSelectionMode.toggledOff;

    selectedEvents.value = _getEventsForDay(_selectedDay);
     update();

    }
    update();
    }
  changeBoolValue(int i ,bool value) {
      print(value);
      print(i);

      TasksModel upDateValue;
    upDateValue=selectedEvents.value[i];
    if(value==true){
      upDateValue=TasksModel(upDateValue.id,upDateValue.idUser,upDateValue.title,upDateValue.subtitle,1,
        upDateValue.y,upDateValue.m,upDateValue.d);
      print( upDateValue.isDone);
    }else{
      upDateValue=TasksModel(upDateValue.id,upDateValue.idUser,upDateValue.title,upDateValue.subtitle,0,
          upDateValue.y,upDateValue.m,upDateValue.d);
      print( upDateValue.isDone);

    }
    selectedEvents.value[i]=upDateValue;
      print(upDateValue);

    tasksDB[DateTime(selectedDay!.year,selectedDay!.month,selectedDay!.day)] =selectedEvents.value;
    update();
    }

void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {

selectedDay = null;
    focusedDay = focusedDay;
    rangeStart = start;
   rangeEnd = end;
rangeSelectionMode = RangeSelectionMode.toggledOn;

  if (start != null && end != null) {
    selectedEvents.value = getEventsForRange(start, end);
    update();

  } else if (start != null) {
   selectedEvents.value = _getEventsForDay(start);
   update();

  } else if (end != null) {
   selectedEvents.value = _getEventsForDay(end);
   update();

  }
update();

}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  update();

  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}
  // add task
  String? titleTask;
  String? supTask;
  String? newNot;
  int idDateTime=0;
  int idTasks=0;
  Future<int> newIdDateTime() async{

    List x=  await db.reads('TaskDatetime',TaskDatetimeModel.fromMap) ;
    x.cast<TaskDatetimeModel>();
    List<TaskDatetimeModel> y =x.cast<TaskDatetimeModel>();
    print('y:$y');
    y.isEmpty?idDateTime=1: idDateTime  =y.last.id+1 ;


    return idDateTime;
      }

  Future<int> newIdTasks() async{

    List x=  await db.reads( 'Tasks',TasksModel.fromMap) ;
    x.cast<TasksModel>();
    List<TasksModel> y =x.cast<TasksModel>();

    y.isEmpty?idTasks=1: idTasks  =y.last.id+1 ;

    return idTasks;
  }


      addTasksMethod() async {

    await newIdDateTime();

    await newIdTasks();


        await db.insert('TaskDatetime',TaskDatetimeModel(idDateTime,selectedDay!.year,selectedDay!.month,selectedDay!.day));

        await db.insert('Tasks',TasksModel(idTasks,'',titleTask!,supTask == null?'':supTask!,0,selectedDay!.year,selectedDay!.month,selectedDay!.day));

        selectedEvents.value.add(TasksModel(idTasks,'',titleTask!,supTask == null?'':supTask!,0,selectedDay!.year,selectedDay!.month,selectedDay!.day));

        tasksDB[DateTime(selectedDay!.year,selectedDay!.month,selectedDay!.day)] =selectedEvents.value;

        update();
      }
      //Note

      addNoteMethod() async {
    await db.insert('NoteTask', NoteModel(1,'titleNote!',selectedDay!.year,selectedDay!.month,selectedDay!.day));
    print(addNewNote());
      }

  Future<List<NoteModel>>  addNewNote() async {
    final db = await  dataBasesLocal.initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('NoteTask');
    return queryResult.map((e) =>  NoteModel.fromMap(e)).toList();

  }
int idNote=0;
 String? titleNote;
newIdNote(){
  addNewNote().asStream().listen((event) {
      event.isNotEmpty?
      idNote = event.last.id:
      idNote=1;
    });
    print(idNote);

    return idNote + 1;


}

  //End Note

     Future readTasks()async{
        List x ;
        List y ;

        x = await db.reads('Tasks', TasksModel.fromMap);
        y = await db.reads('TaskDatetime', TaskDatetimeModel.fromMap);

        allTasksInDB =x.cast<TasksModel>();
        allTaskDateTimeInDB =y.cast<TaskDatetimeModel>();


        for (var taskDateTimeInDB in allTaskDateTimeInDB!) {
          
          for (var tasksInDB in allTasksInDB!) {

            if( taskDateTimeInDB.y==tasksInDB.y&&
                taskDateTimeInDB.d==tasksInDB.d&&
                taskDateTimeInDB.m==tasksInDB.m){

              print(tasksInDB);

              tasksForeOneDays!.add(tasksInDB);

            }
            add();
          }

          tasksDB[DateTime(taskDateTimeInDB.y,taskDateTimeInDB.m,taskDateTimeInDB.d)]=tasksForeOneDays!;
          print(tasksDB);

          tasksForeOneDays=[];
          update();

        }

      }


        add()   {



          kEvents =LinkedHashMap<DateTime, List<TasksModel>>(
            equals: isSameDay,
            hashCode: gettHashCode,
          )..addAll(tasksDB);
          update();

        }


// add task_target
  List<String> op=[];

//task target
  TargetController targetController=Get.put(TargetController());
  Future<List<TargetTasksModel>>? taskTarget;

getTasksTarget() {
  op=[];
  taskTarget= targetController.readTarget();
  // ignore: avoid_function_literals_in_foreach_calls
  taskTarget!.then((value) => value.forEach((element) {
    op.add(element.titleTar);
print(op);
update();
  }));
}

  @override
  void onInit()async {

    add();
    readTasks();
  selectedDay = focusedDay;
  selectedEvents = ValueNotifier(_getEventsForDay(selectedDay!));
update();
print('object');
  super.onInit();
  }
  @override
  void onClose() {
    selectedEvents.dispose();
    super.onClose();
  }
}