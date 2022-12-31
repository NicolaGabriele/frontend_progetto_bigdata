import 'dart:io';
import 'package:http/http.dart';
import 'Utility.dart';

class restManager{

  static Future<String> submitSparkJob(String path, Map<String, String> args) async {
    var uri = Uri.http(Utility.server,path,args);
    var response = await get(uri);
    return response.body;
  }

}