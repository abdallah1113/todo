import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../CustomWidget/custom.dart';
import '../../controller/main_screen_controller.dart';
import '../../model/sql_model/Tasks.dart';
import '../add/add_tasks/add_note.dart';
import '../add/add_tasks/add_task.dart';
import '../add/add_tasks/add_task_target.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  MainScreenController mainScreenController = Get.put(MainScreenController());

  @override
  void initState() {
    mainScreenController.readTasks();
    mainScreenController.add();

    mainScreenController.update();
    print('don1');
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    mainScreenController.tasksDB;
    super.setState(fn);
  }
  Offset _tapPosition=Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    final tapPosition = referenceBox.globalToLocal(details.globalPosition);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child:  GetBuilder<MainScreenController>(
            init: MainScreenController(),
            builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
             SizedBox(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('img/1.jpg'),
                                  fit: BoxFit.cover)),
                          child: TableCalendar<TasksModel>(
                            calendarBuilders: CalendarBuilders(
                                markerBuilder: (context, day, events) =>
                                    events.isNotEmpty
                                        ? Container(
                                            margin: EdgeInsets.all(2),
                                            padding: EdgeInsets.all(2),
                                            alignment: Alignment.center,
                                            color: Colors.grey.shade600,
                                            height: 20,
                                            width: 20,
                                            child: Text(
                                              events.length.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          )
                                        : SizedBox()),
                            headerStyle: HeaderStyle(
                              titleTextStyle: TextStyle(color: Colors.deepOrange),
                              formatButtonDecoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.deepOrange,
                                  ),
                                  borderRadius: BorderRadius.circular(25)),
                              formatButtonTextStyle:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            firstDay: controller.startDate,
                            lastDay: controller.endDate,
                            focusedDay: controller.focusedDay,
                            selectedDayPredicate: (day) =>
                                isSameDay(controller.selectedDay, day),
                            rangeStartDay: controller.rangeStart,
                            rangeEndDay: controller.rangeEnd,
                            calendarFormat: controller.calendarFormat,
                            rangeSelectionMode: controller.rangeSelectionMode,
                            eventLoader: controller.getEventsForDay,
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            calendarStyle: CalendarStyle(
                              // Use `CalendarStyle` to customize the UI
                              outsideDaysVisible: false,
                              defaultTextStyle: TextStyle(color: Colors.white),
                              markerDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.deepOrange,
                              ),
                              markersAlignment: Alignment.bottomRight,
                              selectedDecoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              selectedTextStyle:
                                  TextStyle(color: Colors.teal.shade800),
                              holidayTextStyle: TextStyle(color: Colors.white),
                              weekendTextStyle: TextStyle(color: Colors.white),
                              disabledTextStyle: TextStyle(color: Colors.grey),
                              todayDecoration: BoxDecoration(color: Colors.grey),
                            ),
                            daysOfWeekStyle: const DaysOfWeekStyle(
                              weekdayStyle: TextStyle(color: Colors.deepOrange),
                              weekendStyle: TextStyle(color: Colors.deepOrange),
                            ),
                            onDaySelected: controller.onDaySelected,
                            onRangeSelected: controller.onRangeSelected,
                            onFormatChanged: (format) {
                              if (controller.calendarFormat != format) {
                                setState(() {
                                  controller.calendarFormat = format;
                                });
                              }
                            },
                            onPageChanged: (focusedDay) {
                              controller.focusedDay = focusedDay;
                            },
                          ),
                        ),
                      ),
                // المهام
                Container(
                  margin: const EdgeInsets.only(top: 12,right: 12),
                  child: const Text(
                    'المهام',
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
                // عناصر المهام
                ValueListenableBuilder<List<TasksModel>>(
                        valueListenable: controller.selectedEvents,
                        builder: (context, value, _) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                  ),

                                    child: ListTile(
                                      



                                      leading: Checkbox(
                                        value:value[index].isDone==1?
                                        true:
                                        false,
                                        onChanged: (value){
                                          controller.changeBoolValue(index,value!);
                                        },
                                      ),
                                      trailing: Container(
                                        width: 10,
                                       color: Colors.deepOrange,
                                      ),
                                      minVerticalPadding: 0,
                                      horizontalTitleGap: 8,
                                      dense: true,
                                      style: ListTileStyle.list,
                                      contentPadding: EdgeInsets.only(
                                        left: 15,
                                      ),
                                      onTap: () => print('${value[index]}'),
                                      title: Text(
                                        value[index].title,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      subtitle:value[index].subtitle!='' ? Text(
                                        value[index].subtitle,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(),
                                      ):null,
                                    ),
                                  );
                            },
                          );
                        },
                      ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: SpeedDial(

        onOpen: (){
          mainScreenController.supTask=null;
          mainScreenController.titleTask=null;

        },
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,

        buttonSize: buttonSize,
        // it's the SpeedDial size which defaults to 56 itself
        // iconTheme: IconThemeData(size: 22),

        activeLabel: extend ? const Text("Close") : null,

        childrenButtonSize: childrenButtonSize,
        visible: visible,
        direction: speedDialDirection,
        switchLabelPosition: switchLabelPosition,

        closeManually: closeManually,

        renderOverlay: renderOverlay,

        elevation: 8.0,
        animationCurve: Curves.easeInOutQuint,
        isOpenOnStart: false,
        animationDuration: const Duration(milliseconds: 500),
        shape: const StadiumBorder(),
        // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.accessibility),
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.white,
            label: 'ملاحظه',
            onTap: () => add( AddNote(),context),
          ),
          SpeedDialChild(
            child: const Icon(Icons.brush),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            label: 'هدف',
            onTap: () { add(AddTaskTarget(),context);mainScreenController.getTasksTarget();},
          ),
          SpeedDialChild(
            child: const Icon(Icons.margin),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: 'مهمه',
            visible: true,
            onTap: () => add(const AddTasks(),context),
          ),
        ],
      ),
    );
  }

  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
}
