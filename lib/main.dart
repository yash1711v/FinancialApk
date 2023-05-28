import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'AppRoutes/Approutes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {

    runApp(MyApp());

});}


      class MyApp extends StatelessWidget {

      @override
      Widget build(BuildContext context) {
     return GetMaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         visualDensity: VisualDensity.standard,
       ),
       locale: Get.deviceLocale,
       //for setting localization strings
       fallbackLocale: Locale('en', 'US'),
       title: 'Quick Dine',
       initialRoute: AppRoutes.splashScreen,
       getPages: AppRoutes.pages,
        );
      }}
