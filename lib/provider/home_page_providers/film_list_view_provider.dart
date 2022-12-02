import 'package:flutter/cupertino.dart';
import 'package:tmbd_movies_app/model/home_page_model/top_rated_model.dart';
import 'package:tmbd_movies_app/services/home_page_services/film_service.dart';

class FilmListViewProvider extends ChangeNotifier{
  TopRatedModel topRatedModel = TopRatedModel();
  bool isLoaded = false;

  
  getTopRatedFilm()async{
    isLoaded = false;
    topRatedModel = (await getTopRatedService())!;
    isLoaded = true;
    notifyListeners();
  }
}