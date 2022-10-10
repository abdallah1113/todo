import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CustomWidget/custom.dart';
import '../../controller/achievements_controller.dart';
import '../../controller/main_screen_controller.dart';
import '../add/add_tasks/add_achievments.dart';

class Achievements extends StatelessWidget {
  AchievementsController achievementsController =Get.put(AchievementsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  color: Colors.teal,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    "اهداف هذا الشهر",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                child:  GetBuilder<MainScreenController>(
                    init: MainScreenController(),
                  builder: (context) {
                    return GetBuilder<AchievementsController>(
                      init:AchievementsController() ,
                      builder: (context) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),

                            shrinkWrap: true,
                            itemCount: 20,

                            itemBuilder: (context, index) {
                              return SizedBox(
                                child: Container(

                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.22,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context).size.width *
                                                  0.07,
                                              child: Image.asset('img/done.png'),
                                            ),
                                            SizedBox(
                                                height:
                                                    MediaQuery.of(context).size.width *
                                                        0.07,
                                                child: Image.asset('img/done.png')),
                                            SizedBox(
                                                height:
                                                    MediaQuery.of(context).size.width *
                                                        0.07,
                                                child: Image.asset('img/not.png')),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.7,
                                        child: const Text(
                                            ' اي سيتابنتيساب نتيازد شتيبادز شنتبيد لشنسيتاد ش Adj dfk fungus uuid undef dfس',
                                            textAlign: TextAlign.right),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
      );
  }
}
