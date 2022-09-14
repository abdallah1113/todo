import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../CustomWidget/custom.dart';
import '../../../controller/main_screen_controller.dart';
class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

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
                  widthWidget(context,
                     TextField(
                      textInputAction: TextInputAction.done,
                      controller: controller.supTask,

                      showCursor: false,
                        textAlign: TextAlign.center,
                      autofocus: true,

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
