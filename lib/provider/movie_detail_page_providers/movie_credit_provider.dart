import 'package:flutter/cupertino.dart';
import 'package:tmbd_movies_app/model/movie_detail_page_model/credit_model.dart';

import '../../services/movie_datail_page_services/credit_service.dart';

class MovieCreditProvider extends ChangeNotifier {
   CreditModel creditModel = CreditModel();
  int film_id_credit = 0;
  bool isLoading = false;
  

  getCreditMovie() async {
    isLoading = false;
    creditModel = (await getCreditFilmsService(film_id_credit))!;
    isLoading = true;
    notifyListeners();
  }

   getCreditIdChance(int idChance){
    film_id_credit = idChance;
    getCreditMovie();
    notifyListeners();
  } 
  
}
