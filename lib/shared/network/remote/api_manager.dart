// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:news/models/NewsDataModel.dart';
// import 'package:news/models/SourcesResponse.dart';
// import 'package:news/shared/componats/componants.dart';
// import 'package:news/shared/constant/constant.dart';
//
// class ApiManager {
//   static Future<SourcesResponse> getSources(String category) async {
//     //GET https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
//     var URL = Uri.https(BASE, '/v2/top-headlines/sources',
//         {"apiKey": ApiKey, "category": category});
//
//     try {
//       Response sources = await http.get(URL);
//       var json = jsonDecode(sources.body);
//       SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
//       return sourcesResponse;
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   static Future<NewsDataModel> getData({String? sourceId,String? query}) async {
//     var URL = Uri.https(
//         BASE, '/v2/everything',
//         {"apiKey": ApiKey,
//           "sources": sourceId,
//           "q":query}
//     );
//     Response response = await http.get(URL);
//     var json = jsonDecode(response.body);
//     NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
//     return newsDataModel;
//   }
// }
