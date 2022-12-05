import 'package:dio/dio.dart';

import '../../model/series_page_model/series_model.dart';
//https://api.themoviedb.org/3/tv/popular?api_key=d0e221ec7e3541cae2881583c9669c0d&language=en-US&page=1
final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/tv/"));

Future<SeriesPopularModel?> getSeriesPopularService()async{
  SeriesPopularModel seriesPopularModel = SeriesPopularModel();

  try {
    final response = await _dio.get("popular",queryParameters: {
      "api_key" :"d0e221ec7e3541cae2881583c9669c0d",
      "language" : "en-US",
      "page" : 1
    } );
    seriesPopularModel = SeriesPopularModel.fromJson(response.data);
    print(response.data);
    if (response.statusCode == 200) {
      print("SeriesModel Çalışıyor");
      
    } else {
      print("SeriesModel ÇALIŞMIYOR.");
    }
    return seriesPopularModel;
  } catch (e) {
    print(e);
  }
  return null;
}