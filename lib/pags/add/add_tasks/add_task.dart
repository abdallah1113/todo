
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../CustomWidget/custom.dart';
import '../../../controller/main_screen_controller.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
        init: MainScreenController(),
        builder: (controller) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,

              child: Column(
                children: [

                  paddingWidget(),

                  //paddingWidget(),
                  widthWidget(context,
                    TextField(
                      textInputAction: TextInputAction.next, // Moves focus to next.

                      controller: controller.titleTask,
                      autofocus: true,

                      showCursor: false,
                          textAlign: TextAlign.center,

                          decoration: InputDecoration(
                            hintText: 'مهمه الاساسيه',

                          ),

                      ),
                 ),
                  paddingWidget(),

                  widthWidget(context,
                    TextField(
                        textInputAction: TextInputAction.done,
                        controller: controller.supTask,

                        showCursor: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: 'ماذا نعمل (اختياري)',),
                    ),
                  ),
                  paddingWidget(),

                  widthWidget(context,
                    ListTile(
                      leading: Icon(Icons.add_alert,color: Colors.teal) ,
                      trailing: Switch(
                          value: true,
                          onChanged:(v){} ),
                      title:Text('اضافه اشعار '),
                    ),

                  ),
                  paddingWidget(),
TextButton(onPressed: () async {
 await  controller.addTasksMethod();

  controller.add();
}, child: Text('child'))
                ],
              ),
            ),
          );
        }
    );
  }
}
