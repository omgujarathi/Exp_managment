//import 'dart:html';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
Future<String> save_img(File img1)async{
  final String path=await getFilePath();
  final  fileName = basename(path);
  final File localImage = await img1.copy('$path/$fileName');
  // final File localImage=await img1.copy(await getFilePath());
  return '$path/$fileName';
}
Future<String> getFilePath() async {
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
  String appDocumentsPath = appDocumentsDirectory.path; // 2
  String filePath = appDocumentsPath; // 3

  return filePath;
}