import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pags/ui/fotter_screen.dart';
import 'package:todo/pags/ui/mainScrin.dart';
import 'package:todo/pags/ui/profile.dart';
import 'package:todo/pags/ui/target_menu.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

        title: 'abdallah Demo',
        theme: ThemeData(


          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),

    );
  }
}

