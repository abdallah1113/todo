
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/DB/local/crad.dart';

import '../model/sql_model/Tasks.dart';
import '../utils.dart';



class MainScreenController extends GetxController {
  List<TasksModel> y=[TasksModel(0,'','hi','hi2',1999,2,2)];

  Map<DateTime, List<TasksModel>> x = {
    DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,) : [TasksModel(0,'','hi','hi2',1999,2,2)]
  } ;
  LinkedHashMap? kEvents ;
add(){
  kEvents =LinkedHashMap<DateTime, List<TasksModel>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(x);
  update();

}

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

Future<void> onDaySelected(DateTime _selectedDay, DateTime _focusedDay) async {

  // await db.insert('TaskDatetime',TaskDatetimeModel(1,1,1,1));
  //   print(await db.reads( 'TaskDatetime',TaskDatetimeModel.fromMap) );
  // await db.insert('TasksTar',TasksTar(1,'1','1','1'));
  //  print(await db.reads( 'TasksTar',TasksTar.fromMap) );
  //
  // await db.insert('Point',PointModel('1',1,1,1,1,1,1));
  // print(await db.reads( 'Point',PointModel.fromMap) );
  //
  // await db.insert('Users',Users('1','1','1','1','1'));
  //  print(await db.reads( 'Users',Users.fromMap) );

    print('x=$x');
    print('x=${x.length}');

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



// add task_target
  String? newTaskTitle;
  List<String> op=[' s a','b','c',];





  @override
  void onInit() {
  add();
  selectedDay = focusedDay;
  selectedEvents = ValueNotifier(_getEventsForDay(selectedDay!));

  super.onInit();
  }
  @override
  void onClose() {
    selectedEvents.dispose();
    super.onClose();
  }
}