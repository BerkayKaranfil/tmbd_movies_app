import 'package:dio/dio.dart';

import '../../model/movie_detail_page_model/detail_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/movie/"));


Future<DetailModel?> getDetailedFilmsService(int film_id)async{
  DetailModel filmDetailData = DetailModel();

  try {
    final response = await _dio.get(
      "$film_id?api_key=d0e221ec7e3541cae2881583c9669c0d&language=en-US");

      filmDetailData = DetailModel.fromJson(response.data);
      print(response.data);
      return filmDetailData;
  } catch (e) {
    
  }
  return null;
}