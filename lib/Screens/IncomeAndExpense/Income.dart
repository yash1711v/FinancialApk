import 'package:financeapk/Screens/DatabaseMethods/DatabaseHelper.dart';
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
  void initState(){
    super.initState();
    _refreshJournals();
    print("...number of items ${_journals.length}");
  }

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
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            enableDrag: true,
                            builder: (context) {
                              return
                                SingleChildScrollView(
                                child: Container(
                                  height: 825,
                                  padding: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 10.0),
                                  child: Container(
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
                                                       await SQLHelper.updateIncome(_journals[index]['id'],_NameController.text, _SourceController.text, _CategoryController.text, _AmountController.text, _DateController.text);
                                                       _refreshJournals();
                                                      _NameController.clear(); _SourceController.clear(); _CategoryController.clear(); _AmountController.clear(); _DateController.clear();
                                                      Get.back();
                                                    },
                                                    child: Text("Update Income"),
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
                                  ),
                                ),
                              );
                            });

                      }, icon: const Icon(Icons.edit)),
                      IconButton(onPressed: () async {
                        await SQLHelper.deleteItem(_journals[index]['id']);
                        _refreshJournals();
                      }, icon: Icon(Icons.delete))
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
