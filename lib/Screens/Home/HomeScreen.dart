import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../BottomNavbar/BottomNavBar.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  late int _currentIndex;
  void initState(){
    super.initState();
        _currentIndex=0;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 1,
          centerTitle: true,
          title: Text('Home',
          style: TextStyle(
            color: Colors.white
          ),
          ),
        ),
        body: Center(

        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              bottom: deviceHeight(context) * 0.04 ,
              right: deviceWidth(context)*0.09
          ),
          child: FloatingActionButton(
            splashColor: Colors.green.shade800,
            onPressed: () {

            },
            child: Text(
              "+",
              style: TextStyle(
                  fontSize: 35
              ),
            ),
            backgroundColor: Colors.green,
          ),
        ),
        bottomNavigationBar: BottomNavbar(currentIndex: _currentIndex,),
      ),
    );
  }
}
