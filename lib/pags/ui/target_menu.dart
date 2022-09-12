import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:get/get.dart';

import '../../controller/main_screen_controller.dart';

class TargetMenu extends StatelessWidget {
  const TargetMenu({Key? key}) : super(key: key);

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
              TextButton(onPressed:  (){print(Device.get().isTablet) ;}, child: Text('s')),
              SizedBox(
                child:  GetBuilder<MainScreenController>(
                    init: MainScreenController(),
                  builder: (context) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),

                        shrinkWrap: true,
                        itemCount: 20,

                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Container(
                              // padding: EdgeInsets.all(5),
                              // decoration: BoxDecoration(border: Border.all( color: Colors.grey,width: 1)),
                              margin:
                                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
