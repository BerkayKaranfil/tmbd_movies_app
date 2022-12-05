import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:tmbd_movies_app/model/search_page_model/search_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/search/movie"));

Future<SearchModel?> getSearchService(String query) async {
  SearchModel searchModel = SearchModel();

  try {
    final response = await _dio.get(
        "?api_key=d0e221ec7e3541cae2881583c9669c0d&language=en-US&query=$query&page=1&include_adult=false");

    searchModel = SearchModel.fromJson(response.data);
    print(response.data);
    if (response.statusCode == 200) {
      print("Search Veriler geliyor");
      
    } else {
      print("Search Veriler gelmiyor");
    }
    return searchModel;
  } catch (e) {}
  return null;
}
