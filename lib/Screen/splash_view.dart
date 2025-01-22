import 'dart:async';

import 'package:flutter/material.dart';

import 'grid.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>
                    grid()
                )
            )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/shapes.png', width: 100,
              height: 100,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Geometry Calculator", style: TextStyle(color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
