import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constans.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/source_response.dart';


/*
https://newsapi.org/v2/top-headlines/sources?apiKey=2b2d1f41ba634974b8ee9ba0c0ad689b

 */

class ApiManager {

  static Future<SourceResponse> getSources() async{

    try{

      Uri url = Uri.https(ApiConstans.baseUrl ,
          EndPoints.sourceApi , {
            'apiKey' : ApiConstans.apikey
          }
      );

      var response = await http.get(url);

      var bodyString = response.body;

      /// String => Json

      var json = jsonDecode(bodyString);

      /// Json => Object

      return SourceResponse.fromJson(json);

    }catch(e){

      rethrow ;
    }

  }
}

