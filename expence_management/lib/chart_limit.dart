import 'database_helper_limits.dart';




 Future<List<Map<String,dynamic>>>chart_limit_data() async{
  DatabaseHelper helper = DatabaseHelper();
  List<Map<String,dynamic>> aa=await helper.getlimits();
  return aa;
}