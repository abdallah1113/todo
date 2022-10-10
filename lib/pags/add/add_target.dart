import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:todo/controller/target_controller.dart';

class AddTarget extends StatelessWidget {
  const AddTarget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TargetController>(
        init: TargetController(),
        builder: (controller) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              color: Colors.cyan,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Wrap(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.64,
                        child: TextField(
                          onChanged: (v){
                            controller.newTitle=v;
                            controller.update();
                          },
                          decoration: InputDecoration(),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.05,
                              top: 20),
                          color: Colors.teal,
                          height: 26,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            alignment: Alignment.topRight,
                            onChanged: (e) {
                              controller.weekActive = e!;
                              controller.update();
                            },
                            value: controller.weekActive,
                            items: controller.week
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                          )),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.addTarget();
                      },
                      child: Text('child'))
                ],
              ),
            ),
          );
        });
  }
}
