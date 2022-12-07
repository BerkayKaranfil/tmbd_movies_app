import 'package:flutter/cupertino.dart';
import 'package:tmbd_movies_app/model/movie_detail_page_model/detail_model.dart';
import 'package:tmbd_movies_app/services/movie_datail_page_services/detail_service.dart';

class MovieDetailProvider extends ChangeNotifier{
  DetailModel detailModel = DetailModel();
  int film_id = 123456;
  bool isLoading = false;

  getDetailMovie() async{
    detailModel = (await getDetailedFilmsService(film_id))!;
    isLoading = true;
    notifyListeners();
  }

  getIdChance(int idChance){
    film_id = idChance;
    getDetailMovie();
    notifyListeners();
  }
}