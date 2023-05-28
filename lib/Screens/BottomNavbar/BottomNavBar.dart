import 'package:financeapk/Screens/Home/HomeScreen.dart';
import 'package:financeapk/Screens/Summery/Summery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../IncomeAndExpense/incomeandExpense.dart';
class BottomNavbar extends StatelessWidget {
  var currentIndex;
  BottomNavbar({required this.currentIndex});

  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

    double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: deviceWidth(context) * 0.05, bottom: deviceHeight(context) * 0.02, right: deviceWidth(context) * 0.05),
      padding: EdgeInsets.only(left: deviceWidth(context) * 0.01, right: deviceWidth(context) * 0.01),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                1.0, // Move to right 5  horizontally
                4.0, // Move to bottom 5 Vertically
              ),
            ),
          ]),
      child: SizedBox(
         width: MediaQuery.of(context).size.width,
        child: GNav(
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.redAccent.shade700,
          activeColor: Colors.white,
          selectedIndex: currentIndex,
          haptic: true,
          tabMargin: EdgeInsets.only(top: 5, bottom: 5),
          //textSize: 25,
          // backgroundColor: Colors.transparent,
          tabs: [
            GButton(
              gap: 8,
              icon: Icons.home,
              text: "Home",
              onPressed: () {
                onTapBottomHomeButton();
              },
            ),
            GButton(
              gap: 8,
              icon: Icons.menu_book_outlined,
              text: "I/E",
              onPressed: () {
                onTapIncomeAndExpense();
              },
            ),
            GButton(
              gap: 8,
              icon: Icons.auto_graph_rounded,
               text: "Summery",
              onPressed: () => onTapSummeryIcon(),
            ),
          ],
        ),
      ),
    );
  }

  void onTapBottomHomeButton() {
      Get.off(Home(),
        transition: currentIndex!=0?Transition.fadeIn:Transition.noTransition,
          duration: Duration(seconds: 1)
      );
  }
  void onTapSummeryIcon() {
    Get.off(Summery(),
        transition: currentIndex!=1?Transition.fadeIn:Transition.noTransition,
        duration: Duration(seconds: 1)
    );
  }

  void onTapIncomeAndExpense() {
    Get.off(IncomeandExpense(),
        transition: currentIndex!=1?Transition.fadeIn:Transition.noTransition,
        duration: Duration(seconds: 1)
    );
  }
}
