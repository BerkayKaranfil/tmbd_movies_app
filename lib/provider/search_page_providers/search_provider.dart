import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:tmbd_movies_app/model/search_page_model/search_model.dart';
import 'package:tmbd_movies_app/services/search_page_services/search_service.dart';

class SearchProvider extends ChangeNotifier{
  SearchModel searchModel = SearchModel();
  dynamic query = "Berkay";
  bool isLoaded = false;

  getSearchData()async{
    isLoaded = false;
    searchModel = (await getSearchService(query))!;
   isLoaded = true;
    notifyListeners();
  }

  getQuery(String queryGelen){
    query = queryGelen;
    getSearchData();
    notifyListeners();
  }
}