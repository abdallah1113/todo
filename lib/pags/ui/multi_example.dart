// // Copyright 2019 Aleksander Woźniak
// // SPDX-License-Identifier: Apache-2.0
//
// import 'dart:collection';
//
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import '../model/sql_model/Tasks.dart';
// import '../utils.dart';
//
// class TableMultiExample extends StatefulWidget {
//   @override
//   _TableMultiExampleState createState() => _TableMultiExampleState();
// }
//
// class _TableMultiExampleState extends State<TableMultiExample> {
//   final ValueNotifier<List<Tasks>> _selectedEvents = ValueNotifier([]);
//   final ValueNotifier<List<Tasks>> c = ValueNotifier([]);
//
//   // Using a `LinkedHashSet` is recommended due to equality comparison override
//   final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
//     equals: isSameDay,
//     hashCode: getHashCode,
//   );
//
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//
//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }
//
//   List<Tasks> _getEventsForDay(DateTime day) {
//     // Implementation example
//     return kEvents[day] ?? [];
//   }
//
//   List<Tasks> _getEventsForDays(Set<DateTime> days) {
//
//     return [
//       for (final d in days) ..._getEventsForDay(d),
//     ];
//   }
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     setState(() {
//
//       _focusedDay = focusedDay;
//       // Update values in a Set
//       if (_selectedDays.contains(selectedDay)) {
//         _selectedDays.remove(selectedDay);
//       } else {
//         _selectedDays.add(selectedDay);
//       }
//
//     _selectedEvents.value = _getEventsForDays(_selectedDays);
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar - Multi'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(image:DecorationImage(
//                   image:AssetImage('img/1.jpg'),fit: BoxFit.cover ) ),
//               child: TableCalendar<Tasks>(
//                 calendarStyle: CalendarStyle(rangeHighlightColor: Colors.deepOrange,
//                     defaultTextStyle: TextStyle(color: Colors.white),
//                   disabledTextStyle: TextStyle(color: Colors.blue),
//                   holidayTextStyle: TextStyle(color: Colors.yellowAccent),
//                   outsideTextStyle: TextStyle(color: Colors.orange),
//                   weekendTextStyle: TextStyle(color: Colors.white),
//                   selectedTextStyle: TextStyle(color: Colors.orange),
//                   markerDecoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.circular(50)),
//                   selectedDecoration: BoxDecoration(color: Colors.white ),
//                   outsideDecoration:  BoxDecoration(color: Colors.transparent ),
//                   disabledDecoration:  BoxDecoration(color: Colors.white ),
//                   rangeStartDecoration:  BoxDecoration(color: Colors.blue ),
//                   todayDecoration:  BoxDecoration(color: Colors.blue ),
//                   todayTextStyle: TextStyle(color: Colors.white),
//                 ),
//                 firstDay: kFirstDay,
//                 lastDay: kLastDay,
//                 focusedDay: _focusedDay,
//                 calendarFormat: _calendarFormat,
//                 eventLoader: _getEventsForDay,
//                 startingDayOfWeek: StartingDayOfWeek.monday,
//                 selectedDayPredicate: (day) {
//                   // Use values from Set to mark multiple days as selected
//                   return _selectedDays.contains(day);
//                 },
//                 onDaySelected: _onDaySelected,
//                 onFormatChanged: (format) {
//                   if (_calendarFormat != format) {
//                     setState(() {
//                       _calendarFormat = format;
//                     });
//                   }
//                 },
//                 onPageChanged: (focusedDay) {
//                   _focusedDay = focusedDay;
//                 },
//               ),
//             ),
//             ElevatedButton(
//               child: Text('Clear selection'),
//               onPressed: () {
//                 setState(() {
//                   _selectedDays.clear();
//                   _selectedEvents.value = [];
//                 });
//               },
//             ),
//             const SizedBox(height: 8.0),
//
//             SizedBox(
//               child: ValueListenableBuilder<List<Tasks>>(
//
//                 valueListenable: _selectedEvents,
//                 builder: (context, value, _) {
//                   return ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//
//                     itemCount: value.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: const EdgeInsets.symmetric(
//                           horizontal: 12.0,
//                           vertical: 4.0,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           borderRadius: BorderRadius.circular(25.0),
//                         ),
//                         child: ListTile(
//                           onTap: () => print('${value[index]}'),
//                           title: Text('${value[index]}'),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
