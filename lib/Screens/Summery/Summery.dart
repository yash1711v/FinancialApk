import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../LineChartWidget/LinechartWidget.dart';
import '../BottomNavbar/BottomNavBar.dart';
import 'IncomePoints.dart';
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
  double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  final List<IncomePoints> points=[];
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
        body: Container(
          margin: EdgeInsets.only(
            top: deviceHeight(context)*0.05,
              right:   deviceWidth(context)*0.02,
              left:   deviceWidth(context)*0.02,
          ),
              child: Card(
                child: ListTile(
                  title: Text("Income Source graphy"),
                  subtitle: LineChartWidget(incomePoints),
                ),
              ),
            ),

        bottomNavigationBar: BottomNavbar(currentIndex: _currentIndex,),
      ),
    );
  }
}
