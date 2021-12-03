import 'database_helper_limits.dart';
Future<int> deleteLimitAll() async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  int res1=await databaseHelper.deleteall();
  return res1;
}