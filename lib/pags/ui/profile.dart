import 'package:flutter/material.dart';

import '../../CustomWidget/custom.dart';
import '../../CustomWidget/custom_style.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.teal,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  "abdallah",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('img/man.png'),
                  maxRadius: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.teal,size: 20,),padding: EdgeInsets.zero,
    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.black),
                              borderRadius: BorderRadius.circular(25)
                          ),
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.teal,Colors.teal.shade900],
                              begin: Alignment.bottomRight,
                              end: Alignment.centerLeft,
                            ),
                            color: Colors.teal,
                              border: Border.all(width: 1,color: Colors.black),
                              borderRadius: BorderRadius.circular(25)
                          ),
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 30,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('14',style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),


              ],
            ),
            textTitle('احصئائيه الشهر'),

            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal,

                    image:DecorationImage(image:  AssetImage('img/bgcart.jpg'),fit:BoxFit.cover)
                ),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              y('عمل', 'img/man.png', 20),
                              y('دراسه', 'img/man.png', 20),
                              y('شخصيه', 'img/man.png', 20),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              y('ترفيه', 'img/man.png', 20),
                              y('اخرى', 'img/man.png', 20),
                              y('مهمل', 'img/man.png', 20),

                            ],
                          ),
                        ],
                      ),
                    ),
                    x(30, 30)
                  ],
                ),
              ),
            ),
            textTitle('انجازات الشهر'),

          ],
        ),
      ),
    );
  }
  Widget x (double x, double y){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('390',style: TextStyle(fontSize: x,color: Colors.white),),
        Text('المهام',style:TextStyle(fontSize: x,color: Colors.white)),

      ],
    );
  }
  Widget y (String xn,String xi,double x){
    return Column(
      children: [
        Text('899',style: textCartStyle(),),

        Row(
          children: [
            Text(xn,style: textCartStyle(),),
            Image.asset(xi,height: 15,width: 15,)

          ],
        ),
      ],
    );
  }

}
