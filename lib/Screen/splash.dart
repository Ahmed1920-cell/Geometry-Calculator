import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:project_iti/Screen/grid.dart';


class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: AnimatedSplashScreen(
          splashIconSize: 200,
            duration: 3000,
            splash: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/shapes.png',width: 100,
                    height: 100,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Shapes",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            nextScreen: grid(),
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.black));
  }
}
