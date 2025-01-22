import 'package:flutter/material.dart';
import 'package:project_iti/Model/shape.dart';
import 'package:project_iti/Screen/details_shape.dart';
import 'package:project_iti/Screen/shape_details_screen.dart';

class grid extends StatelessWidget {
  List <Shape> Shapes=[
    Shape(name: "Square",
        image: "assets/images/square (1).png", Formula: [
          "Area=a^2  , a=side",
          "Perimeter=a*4 , a=side",
        ], labels: ["side"], textControllers: [TextEditingController()]),
    Shape(name: "Rectangle",
        image: "assets/images/rectangular.png", Formula: [
          "Area=w*l  , w=width,l=length",
          "Perimeter=(w+l)*2 , w=width,l=length",
        ], labels: ["width","length"], textControllers: [TextEditingController(),TextEditingController()]),
    Shape(name: "Circle",
        image: "assets/images/circle.png", Formula: [
          "Area=πr^2  , r=Radius",
          "Perimeter=2*πr , r=Radius",
        ], labels: ["Radius"], textControllers: [TextEditingController()]),
    Shape(name: "Triangle",
        image: "assets/images/triangle.png", Formula: [
          "Area=(h*b)/2 , h=height,b=base",
          "Perimeter=h+b+a , h=height,b=base,a=side",
        ], labels: ["height","base","side"], textControllers: [TextEditingController(),TextEditingController(),TextEditingController()]),
    Shape(name: "Cube",
        image: "assets/images/cube.png", Formula: [
          "Volume=a^3 , a=side",
          "Total Area=6*a^2  , a=side",
          "Perimeter=a*12 , a=side",
        ], labels: ["side"], textControllers: [TextEditingController()],Is3d: true),
    Shape(name: "Rectangular prism",
        image: "assets/images/Rectangular prism.png", Formula: [
          "Volume=w*l*h  , w=width,l=length,h=height",
          "Total Area=(w*l+w*h+h*l) , w=width,l=length,h=height",
          "Perimeter=(w+l)*2 , w=width,l=length",
        ], labels: ["width","length","height"], textControllers: [TextEditingController(),TextEditingController(),TextEditingController()],Is3d: true),
    Shape(name: "Ball",
        image: "assets/images/ball.png", Formula: [
          "Volume=4/3*πr^3  , r=Radius",
          "Area=4*πr^2  , r=Radius",
        ], labels: ["Radius"], textControllers: [TextEditingController()],Is3d: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFECEFF1),
        //backgroundColor: Colors.grey.withOpacity(0.6),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFECEFF1),
          centerTitle: true,
          title: Text("Geometry Calculator",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF263238), Color(0xFFCFD8DC)],
              ),
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
          ),
          scrollDirection: Axis.vertical,
          children: [
            for(int i=0;i<Shapes.length;i++)
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return ShapeDetailsScreen(shapeModel: Shapes[i]);
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(height: 10, width: 10 , decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
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
                      child: Image.asset(Shapes[i].image,width: 200,height: 130,),
                    ),
                    Text(Shapes[i].name,style: TextStyle(color: Colors.white70,fontSize: 16,fontWeight: FontWeight.bold),)
                  ],
                ),
                ),
              ),
            ), //1
          ],
        ),
      )
    );
  }
}
