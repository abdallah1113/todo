import 'package:flutter/material.dart';
class TargetOfMonth extends StatefulWidget {
   TargetOfMonth({Key? key}) : super(key: key);

  @override
  State<TargetOfMonth> createState() => _TargetOfMonthState();
}

class _TargetOfMonthState extends State<TargetOfMonth> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: SingleChildScrollView(
           child: Column(
             children: [
               Center (
                 child: Container(
                   margin: EdgeInsets.symmetric(vertical: 20),
                   padding: EdgeInsets.only(top: 10,bottom: 10),
                   color: Colors.teal,
                   width: MediaQuery.of(context).size.width*0.7,
                   child: Text("اهداف هذا الشهر",
                     style: TextStyle(
                       fontSize: 20,
                       color: Colors.white
                     ),
                     textAlign: TextAlign.center,),
                 ),
               ),

               SizedBox(
                 child: ListView.builder(
                   physics: NeverScrollableScrollPhysics(),

                   shrinkWrap: true,
                   itemCount: 20,
                   itemBuilder: (context, index) {
                     return Container(
                       margin: EdgeInsets.symmetric(
                         horizontal: 12,
                         vertical: 5
                       ),
                       decoration: BoxDecoration(
                         // border: Border.all(width: 1, color: Colors.grey)
                       ),

                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(

                               margin: EdgeInsets.only(left: 10),
                               padding: EdgeInsets.all(2),
                               color: Colors.teal,
                               height: 26,
                               child: DropdownButton<String>(
                                 onChanged: (e){
                                   setState(() {
                                     x=e!;

                                   });
                                 },
                                 value: x,
                                 items: week.map((e) => DropdownMenuItem(

                                   value: e,
                                   child: Text(e),

                                 ),
                                 ).toList(),

                               )
                           ),

                           Row(
                             children: [

                               SizedBox(
                                   width: MediaQuery.of(context).size.width*0.7,
                                   child: Text('abdall fjkgf gkash kvja sjdfhs hdjg jhdfsg dfhjg dfhjg jhfdg jhf sdh vkgajsdh fksdahfjhsadkjfhdskfjksdljfskdjfsdkfkjsdfasklfkldsd ah',
                                     textAlign: TextAlign.right,
                                   )),
                               Container(
                                 margin: EdgeInsets.only(left: 10),
                                 height: 40,
                                 width: 10,
                                 color: Colors.deepOrange,
                               ),

                             ],
                           ),


                         ]

                     )
                     );

                      } ,
                 ),
               )
             ],
           ),
         ),
       ),
    );
  }

  String x='w1';

  List<String> week=['w1','w2','w3','w4'];
}
