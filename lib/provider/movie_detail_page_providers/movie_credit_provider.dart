import 'package:flutter/cupertino.dart';
import 'package:tmbd_movies_app/model/movie_detail_page_model/credit_model.dart';

import '../../services/movie_datail_page_services/credit_service.dart';

class MovieCreditProvider extends ChangeNotifier {
   CreditModel creditModel = CreditModel();
  int film_id_credit = 0;

  getCreditMovie() async {
    creditModel = (await getCreditFilmsService(film_id_credit))!;
    notifyListeners();
  }

   getCreditIdChance(int idChance){
    film_id_credit = idChance;
    getCreditMovie();
    notifyListeners();
  } 
  
}
