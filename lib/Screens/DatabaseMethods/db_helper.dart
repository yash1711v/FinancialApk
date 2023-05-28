import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHelper{
//variables
static const dbName="myDatabase.db";
static const dbVersion=1;
static const dbTable="Income";
static const dbTable2="Expanse";
static const columnId='id';
static const columnName='Name';
static const columnSource='Source';
static const columnCategory='Category';
static const columnAmount='Amount';
static const columnDate='Date';
//constructor
static DatabaseHelper instance = DatabaseHelper();
//database initialize
static Database? _database;
Future<Database?> get database async{
  if(_database!=null){
    return _database;
  }
  else{
    _database=await initDb();
    return _database;
  }


 }
initDb() async{
  String directory=await getDatabasesPath();
  String path=join(directory,dbName);
  return await openDatabase(path,version: dbVersion,onCreate: onCreate);
}
Future onCreate(Database db,int version) async{
  await db.execute('''
  CREATE TABLE  $dbTable(
  $columnId INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY,
  $columnName TEXT NOT NULL,
  $columnAmount INTEGER NOT NULL,
  $columnSource TEXT,
  $columnCategory TEXT,
  $columnDate TEXT,
  )
  '''
  );
  // await db.execute('''
  // Create table   $dbTable2(
  // $columnId INTEGER PRIMARY KEY,
  // $columnName TEXT NOT NULL,
  // $columnAmount INTEGER NOT NULL,
  // $columnSource TEXT,
  // $columnCategory TEXT,
  // $columnDate DATE,
  // )
  // '''
  // );
}
//Insertion in Income table
 insertinIncome(Map<String,dynamic>row) async{
  Database? db=await instance.database;
  return await db!.insert(dbTable, row);
 }
 //Intertion in Expension Table
  insertinExpanse(Map<String,dynamic>row) async{
    Database? db=await instance.database;
    return await db!.insert(dbTable2, row);
  }
  //reading data of Income Table
 Future<List<Map<String,dynamic>>> readIncome() async {
   Database? db=await instance.database;
   return await db!.query(dbTable);
 }
 //reading data of Expansises table
  Future<List<Map<String,dynamic>>> readExpanse() async {
    Database? db=await instance.database;
    return await db!.query(dbTable2);
  }

  //Updation of Income Table
Future<int> updateIncome(Map<String,dynamic> row)async{
  Database? db=await instance.database;
  int id=row[columnId];
  return await db!.update(dbTable, row,where:'$columnId= ?',whereArgs: [id]);
  }
//Updation of Expanse Table
Future<int> updateExpanse(Map<String,dynamic> row)async{
  Database? db=await instance.database;
  int id=row[columnId];
  return await db!.update(dbTable2, row,where:'$columnId= ?',whereArgs: [id]);
  }
  //Deleting Income table
Future<int> deleteIncome(int id) async{
  Database? db=await instance.database;
  return await db!.delete(dbTable,where: '$columnId=?',whereArgs: [id]);
}
  //Deleting Expanse table
  Future<int> deleteExpanse(int id) async{
    Database? db=await instance.database;
    return await db!.delete(dbTable,where: '$columnId=?',whereArgs: [id]);
  }

}