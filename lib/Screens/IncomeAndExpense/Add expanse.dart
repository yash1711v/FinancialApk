import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../DatabaseMethods/DatabaseHelper.dart';
class AddExpanse extends StatefulWidget {
  @override
  State<AddExpanse> createState() => _AddExpanseState();
}

class _AddExpanseState extends State<AddExpanse> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _NameController = TextEditingController();

  TextEditingController _SourceController = TextEditingController();

  TextEditingController _CategoryController = TextEditingController();

  TextEditingController _AmountController = TextEditingController();

  TextEditingController _DateController = TextEditingController();

  final FocusNode _NameNode = FocusNode();

  final FocusNode _SourceNode = FocusNode();

  final FocusNode _CategoryNode = FocusNode();

  final FocusNode _AmountNode = FocusNode();

  final FocusNode _DateNode = FocusNode();

  double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  List<Map<String,dynamic>> _journals= [];
  bool _isloading=true;
  void _refreshJournals() async{
    final data=await SQLHelper.getItems2();
    setState(() {
      _journals=data;
      _isloading=false;
    });
  }
  void initState(){
    super.initState();
    _refreshJournals();
  }
  Future<void> _addItem() async {
    print("addItemCalled");
    await SQLHelper.createItem2(_NameController.text, _SourceController.text, _CategoryController.text, _AmountController.text, _DateController.text);
    print("NUmber of Items ${_journals.length}");
    print("NUmber of Items "+_journals.toString());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 1,
        centerTitle: true,
        title: Text('Add Expanse',
          style: TextStyle(
              color: Colors.yellowAccent
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: deviceWidth(context)*0.9,
              margin: EdgeInsets.only(top: deviceHeight(context)*0.09, right:deviceWidth(context)*0.05,left: deviceWidth(context)*0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //margin: EdgeInsets.only(top: deviceHeight(context)*0.09, deviceWidth(context)*0.05,left: deviceWidth(context)*0.05),
                    child: SizedBox(
                      width: deviceWidth(context),
                      child: TextField(
                        controller: _NameController,
                        obscureText: false,
                        focusNode: _NameNode,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                            ),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 5,
                                color:
                                Colors.red.shade500),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          hintText: 'Enter Your name',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: deviceHeight(context)*0.03,),
                    child: SizedBox(
                      width: deviceWidth(context),
                      child: TextField(
                        controller: _SourceController,
                        obscureText: false,
                        focusNode: _SourceNode ,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                            ),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 5,
                                color:
                                Colors.red.shade500),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          hintText: 'Enter Your Source Of income',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: deviceHeight(context)*0.03,),
                    child: SizedBox(
                      width: deviceWidth(context),
                      child: TextField(
                        controller: _CategoryController,
                        obscureText: false,
                        focusNode: _CategoryNode ,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                            ),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 5,
                                color:
                                Colors.red.shade500),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          hintText: 'Enter Category(e.g., salary, gifts, rent, food, transport, etc.)',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: deviceHeight(context)*0.03,),
                    child: SizedBox(
                      width: deviceWidth(context),
                      child: TextField(
                        controller: _AmountController ,
                        obscureText: false,
                        focusNode: _AmountNode,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                            ),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 5,
                                color:
                                Colors.red.shade500),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          hintText: 'Enter Your Amount',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: deviceHeight(context)*0.03,),
                    child: SizedBox(
                      width: deviceWidth(context),
                      child: TextField(
                        controller: _DateController ,
                        obscureText: false,
                        focusNode: _DateNode ,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                            ),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 5,
                                color:
                                Colors.red.shade500),
                            borderRadius:
                            BorderRadius.circular(15.0),
                          ),
                          hintText: 'Enter Your Date',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: deviceHeight(context)*0.05,),
                    child: SizedBox(
                      width: deviceWidth(context)*0.9,
                      height: deviceHeight(context)*0.1,
                      child: ElevatedButton(
                        onPressed: () async{
                          await _addItem();
                          // await DatabaseHelper.instance.insertinIncome({
                          //   DatabaseHelper.columnName: _NameController.text,
                          //   DatabaseHelper.columnSource: _SourceController.text,
                          //   DatabaseHelper.columnCategory: _CategoryController.text,
                          //   DatabaseHelper.columnAmount: _AmountController.text,
                          //   DatabaseHelper.columnDate: _DateController.text,
                          // });
                          // Future.delayed(Duration(seconds: 1),() async {
                          //   var dbquery=await DatabaseHelper.instance.readIncome();
                          //   print(dbquery);
                          // });
                        },
                        child: Text("Add Income"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: Colors.redAccent,

                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
