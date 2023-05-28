import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../BottomNavbar/BottomNavBar.dart';
class Summery extends StatefulWidget {
  const Summery({Key? key}) : super(key: key);

  @override
  State<Summery> createState() => _SummeryState();
}

class _SummeryState extends State<Summery> {
  late int _currentIndex;
  void initState(){
    super.initState();
    _currentIndex=2;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            elevation: 1,
            centerTitle: true,
            title: Text('Summery',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        body: Center(
            child: Text(
                'S'
            )
        ),
        bottomNavigationBar: BottomNavbar(currentIndex: _currentIndex,),
      ),
    );
  }
}
