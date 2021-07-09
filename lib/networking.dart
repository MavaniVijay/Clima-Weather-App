import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  //3. class make netwoek helper and in make url
  NetworkHelper(this.url);
  String url;
  Future getdata() async {
    //4. loading screen getdata function move to in networking file past here.
    http.Response response = await http.get(url);

    /// print(response.statusCode); //use it status code and body
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
