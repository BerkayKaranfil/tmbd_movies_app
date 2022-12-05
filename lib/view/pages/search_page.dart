import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmbd_movies_app/provider/search_page_providers/search_provider.dart';
import 'package:tmbd_movies_app/services/search_page_services/search_service.dart';

import '../../provider/movie_detail_page_providers/movie_detail_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // getSearchService("Road");
    SearchProvider data5;
    data5 = Provider.of<SearchProvider>(context, listen: false);
    data5.getSearchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff303243), Color(0xff15151D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: 5.w, left: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/return2.png",
                      scale: 0.1.h,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Return",
                    style: GoogleFonts.inter(
                        fontSize: 16, color: Color(0xffFFFFFF)),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Consumer<SearchProvider>(
                builder: (context, value, Widget) {
                  return Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff36076B),
                        borderRadius: BorderRadius.circular(32)),
                    child: TextFormField(
                        onChanged: (deger) {
                          if (deger.isEmpty) {
                            value.getQuery("Matrix");
                          } else {
                            value.getQuery(deger);
                          }
                        },
                        style: GoogleFonts.inter(color: Color(0xffFFFFFF)),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: Color(0xffFFFFFF),
                                  size: 4.h,
                                )),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff222222), width: 1),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff222222),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(32)),
                            focusColor: Colors.white)),
                  );
                },
              ),
              Consumer<SearchProvider>(
                builder: (context, value, Widget) {
                  return SizedBox(
                    height: 70.h,
                    width: 100.w,
                    child: ListView.builder(
                      itemCount: value.searchModel.results!.length,
                      itemBuilder: (context, index) {
                        return value.searchModel.results == null
                            ? Shimmer.fromColors(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 3.h),
                                  child: Row(children: [
                                    Container(
                                      height: 15.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 0.5.w,
                                            color: Color.fromARGB(
                                                255, 73, 71, 71)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 2.h,
                                          width: 40.w,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          height: 2.h,
                                          width: 25.w,
                                          color: Colors.amber,
                                        )
                                      ],
                                    )
                                  ]),
                                ),
                                baseColor:
                                    Colors.grey.shade300.withOpacity(0.4),
                                highlightColor:
                                    Colors.grey.shade500.withOpacity(0.4))
                            : Row(
                                children: [
                                  Container(
                                    height: 15.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 0.5.w,
                                            color: Color.fromARGB(
                                                255, 73, 71, 71)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${value.searchModel.results![index].posterPath}"))),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 2.h,
                                        width: 60.w,
                                        //color: Colors.blue,
                                        // Buradan see more boyutunu ayarla.
                                        child: Text(
                                          value.searchModel.results![index].title
                                              .toString(),
                                          style: GoogleFonts.inter(
                                              fontSize: 2.h,
                                              color: Color(0xffFFFFFF),), overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "Rating = ${value.searchModel.results![index].voteAverage.toStringAsFixed(1)}/10",
                                        style: GoogleFonts.inter(
                                            fontSize: 1.8.h,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                    ],
                                  )
                                  // Buraya see more butonu koy, basıldığında filmin detaylarına gitsin.
                                ],
                              );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
