import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier{
  int categoryIndex = 0;
  List<String> category = ["Films", "Series", "Animes", "Popular", "For Kids"];


  changeText(int index) {
    
   int categoryIndex = index;
    print(categoryIndex);
    notifyListeners();
  }

 /*  textCategoryChance() {
    switch (categoryIndex) {
      case 0:
        return List1News();
      case 1:
        return List2Video();
    }
    print(categoryIndex);
   
  } */
}