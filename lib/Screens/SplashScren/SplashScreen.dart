import 'dart:async';

import 'package:financeapk/AppRoutes/Approutes.dart';
import 'package:financeapk/Screens/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    //This is to Route the Splash Screen After SomeTime(2 second)
  Future.delayed(Duration(seconds: 2),(){
     Get.off(Home(),
         transition:Transition.circularReveal,//Setting Transitions
         duration: Duration(seconds: 2)//ToSet The Duration Between navugation For Transition
     );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 200,
                  width: 200,
                  child:
                  // Lottie.asset("assets/images/ani.mp4.lottie.json",
                  // ), this is to add some Animation If Want From our Local Files Present in the Code
                 Image.asset(
                     "assets/Logo.png",
                 height: 150,
                 )
                //Lottie.network("https://assets7.lottiefiles.com/packages/lf20_vkqybeu5/data.json"), // this is to add some Animation If WantFrom The Internet
              )
            ],
        ),
      ),
    );
  }
}
