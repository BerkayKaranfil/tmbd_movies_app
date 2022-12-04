import 'package:dio/dio.dart';

import '../../model/movie_detail_page_model/credit_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/movie/"));

    Future<CreditModel?> getCreditFilmsService(int film_id_credit)async{
  CreditModel filmCreditData = CreditModel();

  try {
    final response = await _dio.get(
      "$film_id_credit/credits?api_key=d0e221ec7e3541cae2881583c9669c0d&language=en-US");

      filmCreditData = CreditModel.fromJson(response.data);
      print(response.data);
      return filmCreditData;
  } catch (e) {
    
  }
  return null;
}