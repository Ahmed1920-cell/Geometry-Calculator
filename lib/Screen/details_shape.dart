import 'package:flutter/material.dart';
import 'package:project_iti/Model/shape.dart';

class details extends StatelessWidget {
  late Shape shape;
  details({super.key,required this.shape});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
          children: [
            Expanded(
              child: Container(height: 200,  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF263238), Color(0xFFCFD8DC)],
                ),
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(shape.image,width: 200,height: 130,),
                    ),
                    Text(shape.name,style: TextStyle(color: Colors.white70,fontSize: 19,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(height: 200,  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Color(0xFF263238), Color(0xFFCFD8DC)],
                ),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Formula:",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                      for(int j=0;j<shape.Formula.length;j++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(shape.Formula[j],style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
