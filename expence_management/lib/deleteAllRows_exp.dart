import 'database_helper_exp.dart';
Future<int> deleteExpAll() async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  int res1=await databaseHelper.deleteall();
  return res1;
}