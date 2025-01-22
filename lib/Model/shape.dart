import 'package:flutter/material.dart';
class Shape{
  late String name;
  late String image;
  late List<TextEditingController> textControllers;
  late List<String> labels;
  late List<String> Formula;
  late bool Is3d;


  Shape({required this.name,required this.image,required this.Formula,required this.labels,required this.textControllers,this.Is3d=false});
}