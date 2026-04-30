import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constans.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/new_response.dart';
import 'package:news_app/model/source_response.dart';


/*
https://newsapi.org/v2/top-headlines/sources?apiKey=2b2d1f41ba634974b8ee9ba0c0ad689b

 */

class ApiManager {

  static Future<SourceResponse> getSources(String categoryId) async{

    try{

      Uri url = Uri.https(ApiConstans.baseUrl ,
          EndPoints.sourceApi , {
            'apiKey' : ApiConstans.apikey,
            'category' : categoryId
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


  static Future<NewResponse> getNewsBySourceID(String sourceId) async{

    try{

      Uri url = Uri.https(ApiConstans.baseUrl,
          EndPoints.newsApi ,
          {
            'apiKey' : ApiConstans.apikey,
            'sources' : sourceId
          }
      );



      var response = await http.get(url);

      var json = jsonDecode(response.body);

      NewResponse.fromJson(jsonDecode(response.body));

      return NewResponse.fromJson(json);

    }catch(e){

      rethrow ;
    }


  }

}

/*
 https://newsapi.org/v2/everything?q=bitcoin&apiKey=2b2d1f41ba634974b8ee9ba0c0ad689b
 */