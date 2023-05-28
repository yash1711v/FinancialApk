import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqflite.dart';
import 'Add expanse.dart';
class Expanse extends StatefulWidget {
  const Expanse({Key? key}) : super(key: key);

  @override
  State<Expanse> createState() => _ExpanseState();
}

class _ExpanseState extends State<Expanse> {
  double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Expanse")),
      floatingActionButton: Container(
        margin: EdgeInsets.only(
            bottom: deviceHeight(context) *  0.15  ,
            right: deviceWidth(context)*0.09
        ),
        child: FloatingActionButton(
          splashColor: Colors.green.shade800,
          onPressed: () {
            Get.dialog(
              SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        24)),
                title: Text(
                    "Add Expanses"),
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      Get.to(AddExpanse(),
                          transition: Transition.downToUp);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.red.shade800,
                              size: 100,
                            ),
                          ),
                          Container(
                            child: Text(
                              "Add Expanse",
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
    );
  }
}
