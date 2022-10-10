import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:todo/controller/target_controller.dart';
import 'package:todo/pags/add/add_target.dart';

import '../../CustomWidget/custom.dart';
import '../../model/sql_model/tar_tasks.dart';

class TargetTasks extends StatefulWidget {
  TargetTasks({Key? key}) : super(key: key);

  @override
  State<TargetTasks> createState() => _TargetTasksState();
}

class _TargetTasksState extends State<TargetTasks> {

  TargetController targetController=Get.put(TargetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: SingleChildScrollView(
           child: GetBuilder<TargetController>(
        init: TargetController(),
    builder: (controller) {
               return Column(
                 children: [
                   Center (
                     child: Container(
                       margin: EdgeInsets.symmetric(vertical: 20),
                       padding: EdgeInsets.only(top: 10,bottom: 10),
                       color: Colors.teal,
                       width: MediaQuery.of(context).size.width*0.7,
                       child: const Text("اهداف هذا الشهر",
                         style: TextStyle(
                           fontSize: 20,
                           color: Colors.white
                         ),
                         textAlign: TextAlign.center,),
                     ),
                   ),

                      SizedBox(
                          child:  FutureBuilder<List<TargetTasksModel>>(
                            future: controller.targetDb,
                            builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                            return const Center(
                            child: CircularProgressIndicator(),
                            );
                            } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                            } else if (snapshot.data == null) {
                            return const Center(
                            child: Center(child: Text('لا يوجد بيانات')),
                            );
                            }else{
                            final items = snapshot.data ?? <TargetTasksModel>[];
                             return ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               reverse: true,
                               shrinkWrap: true,
                               itemCount: items.length,
                               itemBuilder: (context, index) {
                                 return Container(
                                   margin: EdgeInsets.symmetric(
                                     horizontal: 12,
                                     vertical: 5
                                   ),


                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Container(

                                           margin: EdgeInsets.only(left: 10),
                                           padding: EdgeInsets.all(2),
                                           color: Colors.teal,
                                           height: 26,
                                           child: DropdownButton<String>(
                                             onChanged: (e){
                                               controller.weekChanged(index,controller.weekNun(e!));
                                             },
                                             value: controller. weekNunToString(items[index].weekNun),

                                             items: controller.week.map((e) => DropdownMenuItem(

                                               value: e,
                                               child: Text(e),

                                             ),
                                             ).toList(),

                                           )
                                       ),

                                       Row(

                                         children: [
                                           SizedBox(
                                               width: MediaQuery.of(context).size.width*0.7,
                                               child: Text(items[index].titleTar,
                                                 textAlign: TextAlign.right,
                                               )),
                                           Container(
                                             margin: EdgeInsets.only(left: 10),
                                             height: 40,
                                             width: 10,
                                             color: Colors.deepOrange,
                                           ),

                                         ],
                                       ),


                                     ]

                                 )
                                 );

                                  } ,
                             );
                           }}
                         )
                       )
                     ],
                   );
             }
           ),
             ),

         ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
       await targetController.newID();

        add(const AddTarget(),context);
      },child: const Icon(Icons.add),backgroundColor: Colors.deepOrange),
    );
  }

  checkValeu(List x,Widget y){
    x.isNotEmpty? y : Center(child: Text('data'));


  }

}
