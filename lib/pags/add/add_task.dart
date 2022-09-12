
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.yellowAccent,

              child: ListView.builder(

                reverse:true ,
                itemCount: 3,
               itemBuilder: (BuildContext context, int index) {
                 return Container(
                    height: 20,
                     child: Text('abdallah'),
                     color: Colors.deepOrange,

                 );
                 },
              ),
            ),
          ),

          TextField(),
        ],
      ),
    );
  }
}
