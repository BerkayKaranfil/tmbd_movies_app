import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmbd_movies_app/provider/home_page_providers/popular_provider.dart';

import '../../pages/movie_detail_page.dart';

class PopularListViewWidget extends StatelessWidget {
  const PopularListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PopularProvider>(
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
              return value.popularModel.results != null
             ? Column(
               // crossAxisAlignment: CrossAxisAlignment.center,
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailPage(film_id: value.popularModel.results![index].id!, film_id_credit: value.popularModel.results![index].id!,),));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      height: 20.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${value.popularModel.results![index].backdropPath}"),
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
                        
                       value.popularModel.results![index].title.toString(),
                        style: GoogleFonts.inter(fontSize: 13, color: Colors.white),
                      ))
                ],
              ) : Shimmer.fromColors(
                      child: Column(
                        children: [
                          Container(
                            height: 20.h,
                            width: 30.w,
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5.w),
                            height: 2.h,
                            width: 20.w,
                            color: Colors.amber,
                          )
                        ],
                      ),
                      baseColor: Colors.grey.shade300.withOpacity(0.4),
                      highlightColor: Colors.grey.shade500.withOpacity(0.4))
              ;
            },
          ),
        );
      },
    );
  }
}