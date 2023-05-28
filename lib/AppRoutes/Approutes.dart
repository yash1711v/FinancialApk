import 'package:financeapk/Screens/Home/HomeScreen.dart';
import 'package:get/get.dart';
import '../Screens/SplashScren/SplashScreen.dart';
import '../Screens/Summery/Summery.dart';
class AppRoutes{
  static const String splashScreen = '/splash_screen';
  static const String homeScreen = '/Home_screen';
  static const String Summery = '/Summery';

  static List<GetPage> pages=[
    GetPage(
        name: splashScreen,
        page:()=> SplashScreen(),
          // bindings: [SplashBinding()]
    ),
    GetPage(
        name: homeScreen,
        page:()=> Home(),
    ),

  ];
}