import 'package:dio/dio.dart';

import '../../model/home_page_model/popular_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/movie/"));
// https://api.themoviedb.org/3/movie/popular?api_key=d0e221ec7e3541cae2881583c9669c0d&language=en-US&page=1
Future<PopularModel?> getPopularService() async {
  PopularModel popularModel = PopularModel();
  try {
    final response = await _dio.get("popular", queryParameters: {
      "api_key": "d0e221ec7e3541cae2881583c9669c0d",
      "language": "en-US",
      "page": 1
    });
    popularModel = PopularModel.fromJson(response.data);
    print(response.data);
    if (response.statusCode == 200) {
      print("Çalışıyor.");
    } else {
      print("Çalışmıyor.");
    }
    return popularModel;
  } catch (e) {
    print(e);
  }
  return null;
}
