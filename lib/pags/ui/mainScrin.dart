
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/pags/add/add_task.dart';


import '../../controller/main_screen_controller.dart';
import '../../model/sql_model/Tasks.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Events'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GetBuilder<MainScreenController>(
              init: MainScreenController(),
              builder: (Controller) {
                return SizedBox(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('img/1.jpg'),fit: BoxFit.cover)
                    ),
                    child: TableCalendar<TasksModel>(
                      calendarBuilders: CalendarBuilders(markerBuilder:(context, day, events) =>
                       events.isNotEmpty?
                          Container(
                            margin: EdgeInsets.all(2),
                            padding: EdgeInsets.all(2),
                            alignment: Alignment.center,
                            color: Colors.grey.shade600,
                            height: 20,
                            width: 20,
                            child:Text( events.length.toString(),style: TextStyle(color: Colors.white,fontSize: 12    ),),
                          ) :SizedBox()

                      ),
                      headerStyle: HeaderStyle(titleTextStyle:TextStyle(color: Colors.deepOrange),
                      formatButtonDecoration: BoxDecoration(border: Border.all(color: Colors.deepOrange,)
                                                            ,borderRadius: BorderRadius.circular(25)),
                        formatButtonTextStyle: TextStyle(color: Colors.white,fontSize: 14),

                      ),
                      firstDay: Controller.startDate,
                      lastDay: Controller.endDate,
                      focusedDay: Controller.focusedDay,
                      selectedDayPredicate: (day) => isSameDay(Controller.selectedDay, day),
                      rangeStartDay: Controller.rangeStart,
                      rangeEndDay: Controller.rangeEnd,
                      calendarFormat: Controller.calendarFormat,
                      rangeSelectionMode:Controller.rangeSelectionMode,
                      eventLoader: Controller.getEventsForDay,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarStyle: CalendarStyle(
                        // Use `CalendarStyle` to customize the UI
                        outsideDaysVisible: false,
                        defaultTextStyle: TextStyle(color: Colors.white),
                        markerDecoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                            color: Colors.deepOrange,
                        ),
                        markersAlignment: Alignment.bottomRight,
                        selectedDecoration: BoxDecoration(color: Colors.white,),
                        selectedTextStyle: TextStyle(color: Colors.teal.shade800),
                        holidayTextStyle: TextStyle(color: Colors.white),
                        weekendTextStyle: TextStyle(color: Colors.white),
                        disabledTextStyle: TextStyle(color: Colors.grey),
                        todayDecoration:  BoxDecoration(color: Colors.grey),

                      ),
                      daysOfWeekStyle:const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.deepOrange),
                        weekendStyle: TextStyle(color: Colors.deepOrange),
                      ) ,

                      onDaySelected: Controller.onDaySelected,
                      onRangeSelected: Controller.onRangeSelected,
                      onFormatChanged: (format) {

                        if (Controller.calendarFormat != format) {
                          setState(() {
                            Controller.calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        Controller.focusedDay = focusedDay;
                      },
                    ),
                  ),
                );
              }
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4.0,
              ),
              child: const Text(
                'المهام',
                style: TextStyle(color: Colors.teal,fontSize: 20),
                  textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              child: GetBuilder<MainScreenController>(
                   init: MainScreenController(),
                   builder: (Controller) {
                   return ValueListenableBuilder<List<TasksModel>>(

                     valueListenable: Controller.selectedEvents,
                     builder: (context, value, _) {
                       return ListView.builder(

                         physics: NeverScrollableScrollPhysics(),

                         shrinkWrap: true,

                         itemCount: value.length,
                         itemBuilder: (context, index) {
                           return Container(
                             margin: const EdgeInsets.symmetric(
                               horizontal: 12.0,
                               vertical: 4.0,
                             ),
                             decoration: BoxDecoration(
                               border: Border.all(),
                               borderRadius: BorderRadius.circular(30.0),
                             ),
                             child: ListTile(
                               trailing: Container(width: 30,decoration: BoxDecoration(
                                   color: Colors.deepOrange,
                                   borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight:Radius.circular(50)  )
                               ),),
                               minVerticalPadding: 0,
                               horizontalTitleGap: 8,
                               dense: true,
                               style: ListTileStyle.list,
                               contentPadding: EdgeInsets.only(left: 15,),
                               onTap: () => print('${value[index]}'),
                               title: Text('${value[index].subtitle}',textAlign: TextAlign.right,style: TextStyle(fontSize: 18),),

                               subtitle: Text(value[index].title,textAlign: TextAlign.right,style: TextStyle(),),
                             )
                           );
                         },
                       );
                     },
                   );
                 }
               ),
            ),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.add),
          onPressed: () {

            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child:  AddTask()),
              ),

            );
          })

    );
  }
}