import 'package:flutter/material.dart';

Widget textTitle(String x){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(x,
    style: TextStyle(color: Colors.teal,fontSize: 18),
    textAlign: TextAlign.right,),
  );
}
Widget paddingWidget(){
  return SizedBox(height: 10,);
}
Widget widthWidget( context ,c){
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    color: Colors.teal.shade300,
    child: c,
  );
}