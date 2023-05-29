import 'package:financeapk/Screens/DatabaseMethods/DatabaseHelper.dart';
import 'package:financeapk/Screens/IncomeAndExpense/UpdateIncome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqflite.dart';
import 'Add Income.dart';
class Income extends StatefulWidget {
  const Income({Key? key}) : super(key: key);

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  void initState(){
    super.initState();
    _refreshJournals();
    print("...number of items ${_journals.length}");
  }
  double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  List<Map<String,dynamic>> _journals= [];
  bool _isloading=true;
  void _refreshJournals() async{
    final data=await SQLHelper.getItems();
    setState(() {
      _journals=data;
      _isloading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        _refreshJournals();
      },
      child: Scaffold(
        extendBody: true,
        body: ListView.builder(
            itemCount: _journals.length,
            itemBuilder: (context,index)=>Card(
              color: Colors.green[200],
              margin: EdgeInsets.all(15),
              child: ListTile(
                leading: Container(
                    margin: EdgeInsets.only(top: 10)
                    ,child: Icon(Icons.arrow_downward,color: Colors.green[900],)),
                title: Text(_journals[index]['Name']),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Source: "+_journals[index]['Source']),
                    Text("Amount: " +_journals[index]['Amount'].toString()),
                    Text("Category: " +_journals[index]['Category'].toString()),
                    Text("Date: " +_journals[index]['Date'].toString()),
                  ],
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Get.to(UpdateItem(),arguments: [{'id': _journals[index]['id']}]);
                      }, icon: const Icon(Icons.edit))
                    ],
                  ),
                ),
              ),
            )),
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              bottom: deviceHeight(context) * 0.15 ,
              right: deviceWidth(context)*0.09,
          ),
          child:
          FloatingActionButton(
            splashColor: Colors.green.shade800,
            onPressed: () {
              Get.dialog(
                SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                          24)),
                  title: Text(
                      "Add Income"),
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Get.to(AddIncome(),
                            transition: Transition.downToUp);
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.arrow_drop_up,
                                color: Colors.green.shade800,
                                size: 100,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Add Income",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
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
      ),
    );
  }
}
