import '../DatabaseMethods/DatabaseHelper.dart';
import 'package:collection/collection.dart';

class IncomePoints{
  final double x;
  final double y;

  IncomePoints({required  this.x,required this.y});}
List<int> _journals=[];
  void _refreshJournals() async{
    final data=await SQLHelper.getItems();
    for(int i=0;i<data.length;i++){
      _journals.add(data[i]['Amount']);
    }
    print(_journals.toString());
  }
  List<IncomePoints> get incomePoints{
    _refreshJournals();
    final data=_journals;
    return data.mapIndexed(((index,element)=>IncomePoints(x: index.toDouble(), y: element.toDouble()))).toList();
  }
