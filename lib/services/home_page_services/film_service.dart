import 'package:dio/dio.dart';
import 'package:tmbd_movies_app/model/home_page_model/top_rated_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/movie/"));

// https://api.themoviedb.org/3/movie/top_rated?api_key=d0e221ec7e3541cae2881583c9669c0d&language=en-US&page=1

    Future<TopRatedModel?> getTopRatedService()async{
      TopRatedModel topRatedModel = TopRatedModel();

      try {
        final response = await _dio.get(
          "top_rated",
          queryParameters: {
            "api_key" : "d0e221ec7e3541cae2881583c9669c0d",
            "language" : "en-US",
            "page" : 1
          }
          );

          topRatedModel = TopRatedModel.fromJson(response.data);
          print(response.data);
          if (response.statusCode == 200) {
            print("Çalışıyor.");
            
          } else {
            print("Çalışmıyor.");
          }
          return topRatedModel;
        
      } catch (e) {
        print(e);
        
      }
      return null;
    }
