import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tmbd_movies_app/provider/home_page_providers/category_list_provider.dart';
import 'package:tmbd_movies_app/provider/home_page_providers/film_list_view_provider.dart';
import 'package:tmbd_movies_app/view/pages/home_page.dart';

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
          ChangeNotifierProvider(create: (context) => CategoryProvider(),)
        ], child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ),);
      },
    );
  }
}
