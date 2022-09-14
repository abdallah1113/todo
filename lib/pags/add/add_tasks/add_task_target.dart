
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../CustomWidget/custom.dart';
import '../../../controller/main_screen_controller.dart';


class AddTaskTarget extends StatelessWidget {

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
                widthWidget(context,
                   DropdownButton(
                    underline: SizedBox(width: 0),

                    iconEnabledColor: Colors.amber,
                    style: const TextStyle(color: Colors.deepOrange),
                    dropdownColor: const Color.fromRGBO(0, 24, 69, 1),
                    alignment: Alignment.center,
                    hint: const Text(
                      'اختيار المهمه',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(218, 162, 15, 1),
                          fontSize: 15),
                    ),

                    value: controller.newTaskTitle,
                    onChanged: (String? value) {
                      controller.newTaskTitle = value!;
                      controller.update();
                    },
                    items: controller.op.map((e) {

                      return DropdownMenuItem(
                        value: e,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.8,

                          child: Center(
                              child: Text(e,
                                  textAlign: TextAlign.right)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                paddingWidget(),
                widthWidget(context,

                   TextField(
                      textInputAction: TextInputAction.done,
                      controller: controller.titleTask,

                      showCursor: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'ماذا نعمل (اختياري)',)
                    ),
                  ),
                ListTile(
                  leading: Icon(Icons.add_alert,color: Colors.teal) ,
                  trailing: Switch(
                      value: true,
                      onChanged:(v){} ),
                  title:Text('اضافه اشعار '),
                )
              ],
            ),
          ),
        );
      }
    );
  }


}
