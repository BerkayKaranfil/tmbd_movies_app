import 'package:flutter/cupertino.dart';
import 'package:tmbd_movies_app/model/home_page_model/popular_model.dart';
import 'package:tmbd_movies_app/services/home_page_services/popular_service.dart';

class PopularProvider extends ChangeNotifier{
  bool isLoaded = false;
  PopularModel popularModel = PopularModel();

  getPopularFilm()async{
    isLoaded = false;
    popularModel = (await getPopularService())!;
    isLoaded = true;
    notifyListeners();
  }
}