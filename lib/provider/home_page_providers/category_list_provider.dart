import 'package:flutter/cupertino.dart';
import 'package:tmbd_movies_app/view/widgets/home_page_widgets/film_list_view_others_widget.dart/animes_widget.dart';
import 'package:tmbd_movies_app/view/widgets/home_page_widgets/film_list_view_others_widget.dart/series_widget.dart';

import '../../view/widgets/home_page_widgets/film_list_view_widget.dart';

class CategoryProvider extends ChangeNotifier {
  int categoryIndex = 0;
  List<String> category = ["Filmes", "Series", "Animes", "Popular", "For Kids"];

  changeText(int index) {
    int categoryIndex = index;
    print(categoryIndex);
    notifyListeners();
  }

  textCategoryChance() {
    switch (categoryIndex) {
      case 0:
        return FilmListviewWidget();
      case 1:
        return SeriesCategory();
      case 2:
        return AnimesCategory();
      case 3:
        return null;
      case 4:
        return null;
    }
    //print(categoryIndex);
  }
}
