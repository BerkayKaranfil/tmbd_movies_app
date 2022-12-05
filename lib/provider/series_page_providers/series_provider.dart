import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tmbd_movies_app/model/series_page_model/series_model.dart';
import 'package:tmbd_movies_app/services/series_page_services/series_service.dart';

class SeriesProvider extends ChangeNotifier{
  bool isLoaded = false;
  SeriesPopularModel seriesPopularModel = SeriesPopularModel();

  getSeries()async{
    isLoaded = false;
    seriesPopularModel = (await getSeriesPopularService())!;
    isLoaded = true;
    notifyListeners();
  }
}