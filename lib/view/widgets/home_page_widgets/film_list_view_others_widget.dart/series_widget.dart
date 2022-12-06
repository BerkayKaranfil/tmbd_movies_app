import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../provider/home_page_providers/category_list_provider.dart';
import '../../../../provider/series_page_providers/series_provider.dart';
import '../../../pages/movie_detail_page.dart';

class SeriesCategory extends StatefulWidget {
  const SeriesCategory({super.key});

  @override
  State<SeriesCategory> createState() => _SeriesCategoryState();
}

class _SeriesCategoryState extends State<SeriesCategory> {
  @override
  void initState() {
    SeriesProvider seriesdata;
    seriesdata = Provider.of(context, listen: false);
    seriesdata.getSeries();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, value, widget) {
      return Consumer<SeriesProvider>(builder: (context, seriescall, Widget) {
        return Container(
          height: 24.h,
          width: 100.w,
          // color: Colors.amber,
          child: ListView.builder(
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return seriescall.seriesPopularModel.results != null
                  ? Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailPage(
                                      film_id: seriescall
                                          .seriesPopularModel.results![index].id!,
                                      film_id_credit: seriescall
                                          .seriesPopularModel.results![index].id!,
                                    ),
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 5.w),
                              height: 20.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${seriescall.seriesPopularModel.results![index].backdropPath}"),
                                    fit: BoxFit.fitWidth),
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                        Container(
                            height: 4.h,
                            width: 35.w,
                            //  color: Colors.red,
                            child: Text(
                              seriescall.seriesPopularModel.results![index].name
                                  .toString(),
                              style: GoogleFonts.inter(
                                  fontSize: 13, color: Colors.white),
                            ))
                      ],
                    )
                  : Shimmer.fromColors(
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
                      highlightColor: Colors.grey.shade500.withOpacity(0.4));
            },
          ),
        );
      },);
    },);
  }
}