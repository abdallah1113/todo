// // Copyright 2019 Aleksander Woźniak
// // SPDX-License-Identifier: Apache-2.0
//
// import 'dart:collection';
//
// import 'package:table_calendar/table_calendar.dart';
// import 'package:todo/model/sql_model/Tasks.dart';
//
// /// Example event class.
//
//
// /// Example events.
// ///
// /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
// final kEvents = LinkedHashMap<DateTime, List<TasksModel>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(x);
// List<TasksModel> y=[TasksModel(0,'','hi','hi2',1999,2,2)];
//  Map<DateTime, List<TasksModel>> x = {
//   DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,) : y
// } ;
// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }
//
//
//
// /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
//
//
