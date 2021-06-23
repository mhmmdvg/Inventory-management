import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class MySqlHelper {
  static const ROOT = 'http://mhmmdvg.000webhostapp.com/getData.php';

  static Future<List> getData() async{
   http.Response response =
        await http.get(ROOT);
    return json.decode(response.body);
  }

}