import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_iti/Screen/grid.dart';

import '../Model/shape.dart';

class ShapeDetailsScreen extends StatelessWidget {
  late Shape shapeModel;

  ShapeDetailsScreen({required this.shapeModel});

  var formKey = GlobalKey<FormState>();

bool Area_Tringle=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF263238), Color(0xFFCFD8DC)],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFECEFF1),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF263238), Color(0xFFCFD8DC)],
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  shapeModel.image,
                                  width: 200,
                                  height: 130,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  shapeModel.name,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Formula:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                for (int j = 0;
                                    j < shapeModel.Formula.length;
                                    j++)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      shapeModel.Formula[j],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Color(0xFF263238),
                          width: 3
                        ),
                        ),
                        //color: Color(0xFF263238)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Data",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.all(5),
                            child: defaultFormField(
                              controller: shapeModel.textControllers[index],
                              type: TextInputType.number,
                              validate: (value) {
                                if(shapeModel.name=="Triangle" && index==2 && Area_Tringle){
                                  return null;
                                }
                                else if (value.isEmpty) {
                                  return 'Field required';
                                }
                                return null;
                              },
                              label: shapeModel.labels[index],
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                          itemCount: shapeModel.labels.length,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: defaultButton(
                                function: () {
                                  if(shapeModel.name=="Triangle")
                                    Area_Tringle=true;
                                  if (formKey.currentState!.validate()) {
                                    showMyDialog(context,
                                        shapeModel.name != "Cube" && shapeModel.name != 'Rectangular prism'?'Area= ${getArea(shapeModel)}':"Total Area= ${getArea(shapeModel)}");
                                  }
                                },
                                text: shapeModel.name != "Cube" && shapeModel.name != 'Rectangular prism'?'Area':"Total Area",
                                isUppercase: false)),
                        SizedBox(
                          width: 10,
                        ),
                        if (shapeModel.name != 'Ball')
                          Expanded(
                              child: defaultButton(
                                  function: () {
                                    if(shapeModel.name=="Triangle")
                                      Area_Tringle=false;
                                    if (formKey.currentState!.validate()) {
                                      showMyDialog(context,
                                          'Perimeter = ${getPerimeter(shapeModel)}');
                                    }
                                  },
                                  text: 'Perimeter',
                                  isUppercase: false)),
                      ],
                    ),
                  ),
                  if (shapeModel.Is3d) ...[
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              showMyDialog(
                                  context, 'Volume = ${getVolume(shapeModel)}');
                            }
                          },
                          text: 'Volume',
                          isUppercase: false),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getArea(Shape model) {
    if (model.name == 'Square') {
      return double.parse(model.textControllers[0].text) *
          double.parse(model.textControllers[0].text);
    } else if (model.name == 'Circle') {
      return (22 / 7) * pow(double.parse(model.textControllers[0].text), 2);
    } else if (model.name == 'Rectangle') {
      return double.parse(model.textControllers[0].text) *
          double.parse(model.textControllers[1].text);
    } else if (model.name == 'Triangle') {
      return (1 / 2) *
          (double.parse(model.textControllers[0].text) *
              double.parse(model.textControllers[1].text));
    } else if (model.name == 'Cube') {
      return 6 * pow(double.parse(model.textControllers[0].text), 2);
    } else if (model.name == 'Ball') {
      return (22 / 7) * 4 * double.parse(model.textControllers[0].text);
    } else if (model.name == 'Rectangular prism') {
      return (double.parse(model.textControllers[0].text) *
              double.parse(model.textControllers[1].text)) +
          (double.parse(model.textControllers[0].text) *
              double.parse(model.textControllers[2].text)) +
          (double.parse(model.textControllers[1].text) *
              double.parse(model.textControllers[2].text));
    }
  }

  getPerimeter(Shape model) {
    if (model.name == 'Square') {
      return double.parse(model.textControllers[0].text) * 4;
    } else if (model.name == 'Circle') {
      return (22 / 7) * 2 * double.parse(model.textControllers[0].text);
    } else if (model.name == 'Rectangle') {
      return (double.parse(model.textControllers[0].text) +
              double.parse(model.textControllers[1].text)) *
          2;
    } else if (model.name == 'Triangle') {
      return double.parse(model.textControllers[0].text) +
          double.parse(model.textControllers[1].text) +
          double.parse(model.textControllers[2].text);
    }
    else if (model.name == 'Cube') {
      return 12 * double.parse(model.textControllers[0].text);
    }  else if (model.name == 'Rectangular prism') {
      return (double.parse(model.textControllers[0].text) +
          double.parse(model.textControllers[1].text))*2;
    }

  }

  getVolume(Shape model) {
    if (model.name == 'Cube') {
      return pow(double.parse(model.textControllers[0].text), 3);
    } else if (model.name == 'Ball') {
      return (22 / 7) *
          (4 / 3) *
          pow(double.parse(model.textControllers[0].text), 3);
    } else if (model.name == 'Rectangular prism') {
      return double.parse(model.textControllers[0].text) *
          double.parse(model.textControllers[1].text) *
          double.parse(model.textControllers[2].text);
    }
  }
}

defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onChange(value)?,
  Function? onSubmitt(value)?,
  Function()? onTap,
  required String? validate(value),
  required String label,
  Icon? prefix,
  IconButton? suffix,
  bool outLineBorder = true,
  bool obsecure = false,
}) =>
    Container(
// height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF263238), Color(0xFFCFD8DC)])),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmitt,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        obscureText: obsecure,
        decoration: InputDecoration(
            hintText: label,
            prefixIcon: prefix,
            suffixIcon: suffix,
            hintStyle: TextStyle(
              color: Color(0xFFCFD8DC),
            ),
            contentPadding: EdgeInsets.all(8),
            border: outLineBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))
                : null,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFCFD8DC),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(25)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFCFD8DC),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(25)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFCFD8DC),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(25))),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  required Function() function,
  bool isUppercase = true,
  required String text,
  double radius = 15.0,
}) =>
    Container(
      width: width,
      height: 35.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFF263238),
      ),
      child: MaterialButton(
        elevation: 5.0,
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Future<void> showMyDialog(context, text) async {

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
      backgroundColor:Color(0xFFECEFF1),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      ),
      //alignment: Alignment.center,
        title: Center(child: const Text('Result')),
        content: Text(text,style: TextStyle(
color: Colors.black87,
fontSize: 18.0,
fontWeight: FontWeight.bold,
),),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
style: ElevatedButton.styleFrom(
primary: Color(0xFF263238),
shape:RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18.0),
)

),
              onPressed: () {
Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_){
return grid();
}),(route)=>false);
},
              child: Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
