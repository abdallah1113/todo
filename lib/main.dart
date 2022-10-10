import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:todo/pags/ui/fotter_screen.dart';
import 'package:todo/pags/ui/mainScrin.dart';
import 'package:todo/pags/ui/profile.dart';


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
        home: AnimatedSplashScreen(
          backgroundColor: const Color.fromRGBO(0, 18, 51, 1),
          nextScreen:  BottomNavigationBarExample(),
          splash:SpinKitFoldingCube(
            color:Colors.amber ,
          ) ,
        ),


    );
  }
}

