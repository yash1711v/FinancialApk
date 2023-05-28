import 'package:financeapk/Screens/IncomeAndExpense/Add%20Income.dart';
import 'package:financeapk/Screens/IncomeAndExpense/Add%20expanse.dart';
import 'package:financeapk/Screens/IncomeAndExpense/Expanse.dart';
import 'package:financeapk/Screens/IncomeAndExpense/Income.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../BottomNavbar/BottomNavBar.dart';
import '../DatabaseMethods/DatabaseHelper.dart';
class IncomeandExpense extends StatefulWidget {
  const IncomeandExpense({Key? key}) : super(key: key);

  @override
  State<IncomeandExpense> createState() => _IncomeandExpenseState();
}

class _IncomeandExpenseState extends State<IncomeandExpense>  with SingleTickerProviderStateMixin {
  double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  late int _currentIndex;
  late TabController tabController;
  List<Map<String,dynamic>> _journals= [];
  bool _isloading=true;
  void _refreshJournals() async{
    final data=await SQLHelper.getItems();
    setState(() {
      _journals=data;
      _isloading=false;
    });
  }
  void initState(){
    super.initState();
    Income();
    Expanse();
    _currentIndex=1;
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 1,
        centerTitle: true,
        title: Text('Income/Expense',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(
                  top: 20, bottom: 0, right: 20, left: 20),
              decoration: BoxDecoration(
                  color: Color(0xFFEA4235),
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TabBar(
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.black,
                      indicatorColor: Colors.white,
                      indicatorWeight: 2,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      controller: tabController,
                      tabs: [
                        Tab(
                          text: 'Income',
                        ),
                        Tab(
                          text: 'Expanse',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                  Income(),
                   Expanse()
                  ],
                ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavbar(currentIndex: _currentIndex,),
    );
  }
}
