import 'package:financeapk/Screens/DatabaseMethods/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;
class UpdateItem extends StatefulWidget {
  @override
  State<UpdateItem> createState() => _UpdateItem();
}

class _UpdateItem extends State<UpdateItem> {
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
   int id=0;
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
    _refreshJournals();
    final routeArgs=ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    setState(() {
      id=routeArgs[id] as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 1,
          centerTitle: true,
          title: Text('Add Income',
            style: TextStyle(
                color: Colors.white
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
                            await SQLHelper.updateIncome(id,_NameController.text, _SourceController.text, _CategoryController.text, _AmountController.text, _DateController.text);
                          },
                          child: Text("Update  Income"),
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
