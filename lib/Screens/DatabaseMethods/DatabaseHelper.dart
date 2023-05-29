import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/material.dart';

class SQLHelper{
  static Future<void> createTables(sql.Database database)async{
    await database.execute('CREATE TABLE INCOME(id INTEGER PRIMARY KEY NOT NULL, Name TEXT, Source TEXT, Category TEXT, Amount INTEGER, Date TEXT)',);
    await database.execute('CREATE TABLE EXPANSE(id INTEGER PRIMARY KEY NOT NULL,Name TEXT,Source TEXT,Category TEXT,Amount INTEGER,Date TEXT),');
  }
  static Future<sql.Database> db() async{
    return sql.openDatabase(
      'Income/Expanse',
      version: 1,
      onCreate: (sql.Database database,int version)async{
        print("creating atable ");
        await createTables(database);
      }
    );
  }
  static Future<int> createItem(String name,String Source,String category,String Amount,String date) async{
    final db=await SQLHelper.db();
    final data={'Name':name,'Source':Source,'Category':category,'Amount':Amount,'Date':date};
    final id=await db.insert('INCOME', data,
        conflictAlgorithm:sql.ConflictAlgorithm.replace);
    return id;

  }

 static Future<int> createItem2(String name,String Source,String category,String Amount,String date) async{
    final db=await SQLHelper.db();
    final data={'Name':name,'Source':Source,'Category':category,'Amount':Amount,'Date':date};
    final id=await db.insert('EXPANSE', data,
        conflictAlgorithm:sql.ConflictAlgorithm.replace);
    return id;
  }


  static Future<List<Map<String,dynamic>>> getItems()  async {
    final db=await SQLHelper.db();
    return db.query('INCOME', orderBy: "id");
  }
  static Future<List<Map<String,dynamic>>> getItems2()  async {
    final db=await SQLHelper.db();
    return db.query('EXPANSE', orderBy: "id");
  }
  static Future<int> updateIncome(int id,String name,String Source,String category,String Amount,String date) async{
    final db =await SQLHelper.db();
    final data={
      'Name':name,'Source':Source,'Category':category,'Amount':Amount,'Date':date
    };
    final result=await db.update('INCOME', data,where: "id=?",whereArgs: [id]);
    return result;
  }
  static Future<void> deleteItem(int id)async{
    final db=await SQLHelper.db();
    try{
      await db.delete('INCOME',where: "id=?",whereArgs: [id]);
    }catch(err){
      debugPrint("SOmething Went Wrong When Deleting an item: $err");
    }
  }
}
