// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import '../../../CustomWidget/custom.dart';
// import '../../../controller/achievements_controller.dart';
// import '../../../controller/main_screen_controller.dart';
// class AddAchievements extends StatelessWidget {
//   const AddAchievements({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AchievementsController>(
//         init: AchievementsController(),
//         builder: (controller) {
//           return Directionality(
//             textDirection: TextDirection.rtl,
//             child: Container(
//               width: MediaQuery.of(context).size.width*0.5,
//
//               child: Column(
//                 children: [
//
//                   paddingWidget(),
//                   widthWidget(context,
//                     TextField(
//                       textInputAction: TextInputAction.done,
//                       onChanged: (v){
//                         controller.title=v;
//                       },
//                       showCursor: false,
//                       textAlign: TextAlign.center,
//                       autofocus: true,
//
//                     ),
//                   ),
//                   paddingWidget(),
//                   widthWidget(context,
//                     ElevatedButton(
//                       onPressed: (){
//                       },
//                       child: Text('child'),),)
//                 ],
//               ),
//             ),
//           );
//         }
//     );
//
//   }
// }
