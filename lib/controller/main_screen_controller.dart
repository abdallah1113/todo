
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/DB/local/crad.dart';

import '../model/sql_model/Tasks.dart';
import '../model/sql_model/task_datetime.dart';
import '../utils.dart';



class MainScreenController extends GetxController {
  List<TasksModel> y=[TasksModel(0,'','hi','hi2',1999,2,2)];

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

readFromDB(){
}

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
TextEditingController titleTask=TextEditingController();
    TextEditingController supTask=TextEditingController();
      TextEditingController newNot=TextEditingController();
  int idDateTime=0;
  int idTasks=0;
  Future<int> NewIdDateTime() async{

    List x=  await db.reads('TaskDatetime',TaskDatetimeModel.fromMap) ;
    x.cast<TaskDatetimeModel>();
    List<TaskDatetimeModel> y =x.cast<TaskDatetimeModel>();
    idDateTime  =y.last.id+1;
    print('id:$y.last.id+1');
    return idDateTime;
      }
  Future<int> NewIdTasks() async{

    List x=  await db.reads( 'Tasks',TasksModel.fromMap) ;
    x.cast<TasksModel>();
    List<TasksModel> y =x.cast<TasksModel>();
    idTasks =y.last.id+1;
    print('id:$y.last.id+1');
    return idTasks;
  }
      addTasksMethod() async {

    await NewIdDateTime();
    await NewIdTasks();

        await db.insert('TaskDatetime',TaskDatetimeModel(idDateTime,selectedDay!.year,selectedDay!.month,selectedDay!.day));

        await db.insert('Tasks',TasksModel(idTasks,'',titleTask.text,supTask.text,selectedDay!.year,selectedDay!.month,selectedDay!.day));

        selectedEvents.value.add(TasksModel(idTasks,'',titleTask.text,supTask.text,selectedDay!.year,selectedDay!.month,selectedDay!.day));

        tasksDB[DateTime(selectedDay!.year,selectedDay!.month,selectedDay!.day)] =selectedEvents.value;

        update();
      }

     Future x()async{
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

        newId(){

        }
// add task_target
  String? newTaskTitle;
  List<String> op=[' s a','b','c',];





  @override
  void onInit()async {

    add();
    x();
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