import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tmbd_movies_app/view/pages/movie_detail_page.dart';

import '../../../provider/home_page_providers/film_list_view_provider.dart';

class FilmListviewWidget extends StatelessWidget {
  const FilmListviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmListViewProvider>(
      builder: (context, value, Widget) {
        return Container(
          height: 24.h,
          width: 100.w,
         // color: Colors.amber,
          child: ListView.builder(
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
               // crossAxisAlignment: CrossAxisAlignment.center,
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailPage(film_id: value.topRatedModel.results![index].id!, film_id_credit: value.topRatedModel.results![index].id!,),));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      height: 20.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${value.topRatedModel.results![index].backdropPath}"),
                            fit: BoxFit.fitWidth),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                      height: 4.h,
                      width: 35.w,
                    //  color: Colors.red,
                      child: Text(
                        value.topRatedModel.results![index].title.toString(),
                        style: GoogleFonts.inter(fontSize: 13, color: Colors.white),
                      ))
                ],
              );
            },
          ),
        );
      },
    );
  }
}
