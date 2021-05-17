import 'dart:convert';

import 'package:http/http.dart';

class ApiManager{
  final String url;
  ApiManager(this.url);

  Future getNews() async {
    Response response;
    var jsonResponse;
    response = await get(Uri.parse(Uri.encodeFull(url))); //get method
    if(response.statusCode == 200){
      jsonResponse = json.decode(response.body); //Json String converted to json object
      return jsonResponse;
    }else{
      return null;
    }
  }

}