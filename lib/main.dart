import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tmbd_movies_app/provider/home_page_providers/category_list_provider.dart';
import 'package:tmbd_movies_app/provider/home_page_providers/film_list_view_provider.dart';
import 'package:tmbd_movies_app/provider/home_page_providers/popular_provider.dart';
import 'package:tmbd_movies_app/provider/movie_detail_page_providers/movie_credit_provider.dart';
import 'package:tmbd_movies_app/provider/movie_detail_page_providers/movie_detail_provider.dart';
import 'package:tmbd_movies_app/provider/search_page_providers/search_provider.dart';
import 'package:tmbd_movies_app/provider/series_page_providers/series_provider.dart';
import 'package:tmbd_movies_app/view/pages/home_page.dart';
import 'package:tmbd_movies_app/view/pages/movie_detail_page.dart';
import 'package:tmbd_movies_app/view/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, Orientation, ScreenType) {
        return MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => FilmListViewProvider(),),
          ChangeNotifierProvider(create: (context) => CategoryProvider(),),
          ChangeNotifierProvider(create: (context) => PopularProvider(),),
          ChangeNotifierProvider(create: (context) => MovieDetailProvider(),),
          ChangeNotifierProvider(create: (context) => MovieCreditProvider(),),
          ChangeNotifierProvider(create: (context) => SearchProvider(),),
          ChangeNotifierProvider(create: (context) => SeriesProvider(),)
        ], child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: //SearchPage()
          HomePage()
         // MovieDetailPage(film_id: 436270, film_id_credit: 436270,),
        ),);
      },
    );
  }
}
