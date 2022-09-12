import 'package:flutter/material.dart';

Widget textTitle(String x){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(x,
    style: TextStyle(color: Colors.teal,fontSize: 18),
    textAlign: TextAlign.right,),
  );
}