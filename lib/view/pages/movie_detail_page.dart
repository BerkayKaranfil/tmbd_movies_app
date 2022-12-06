import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../provider/movie_detail_page_providers/movie_credit_provider.dart';
import '../../provider/movie_detail_page_providers/movie_detail_provider.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage(
      {super.key, required this.film_id, required this.film_id_credit});
  final int film_id;
  final int film_id_credit;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    MovieDetailProvider? data2;
    data2 = Provider.of<MovieDetailProvider>(context, listen: false);
    data2.getIdChance(widget.film_id);

    MovieCreditProvider? data3;
    data3 = Provider.of<MovieCreditProvider>(context, listen: false);
    data3.getCreditIdChance(widget.film_id_credit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff303243),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xff303243),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff303243), Color(0xff15151D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<MovieDetailProvider>(
                builder: (context, value, Widget) {
                  return value.detailModel.backdropPath != null
                      ? Container(
                          height: 50.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${value.detailModel.backdropPath}"),
                                  fit: BoxFit.fill)),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: 45.h, left: 5.w),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/return2.png",
                                      scale: 0.1.h,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Return",
                                      style: GoogleFonts.inter(
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF)),
                                    )
                                  ],
                                ),
                              )),
                        )
                      : Shimmer.fromColors(
                          child: Container(
                            height: 50.h,
                            width: 100.w,
                            color: Colors.amber,
                          ),
                          baseColor: Colors.grey.shade300.withOpacity(0.4),
                          highlightColor:
                              Colors.grey.shade500.withOpacity(0.4));
                },
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.w, left: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Consumer<MovieDetailProvider>(
                      builder: (context, value, Widget) {
                        return Row(
                          children: [
                            value.detailModel.voteAverage != null
                                ? CircularPercentIndicator(
                                    radius: 10.w,
                                    arcType: ArcType.FULL,
                                    arcBackgroundColor: Color(0xff15161D),
                                    lineWidth: 1.w,
                                    progressColor: Color(0xffFF1F8A),
                                    percent:
                                        (value.detailModel.voteAverage * 10) /
                                            100,
                                    center: Text(
                                      "${value.detailModel.voteAverage.toStringAsFixed(1)}/10",
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          color: Color(0xffFFFFFF)),
                                    ))
                                : Shimmer.fromColors(
                                    child: Container(
                                      height: 15.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.amber),
                                    ),
                                    baseColor:
                                        Colors.grey.shade300.withOpacity(0.4),
                                    highlightColor:
                                        Colors.grey.shade500.withOpacity(0.4)),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  //height: 4.h,
                                  width: 65.w,
                                  child: FittedBox(
                                    child: value.detailModel.title != null
                                        ? Text(
                                            value.detailModel.title.toString(),
                                            style: GoogleFonts.inter(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFFFFFF)),
                                          )
                                        : Shimmer.fromColors(
                                            child: Container(
                                              height: 3.h,
                                              width: 50.w,
                                              color: Colors.amber,
                                            ),
                                            baseColor: Colors.grey.shade300
                                                .withOpacity(0.4),
                                            highlightColor: Colors.grey.shade500
                                                .withOpacity(0.4)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    value.detailModel.releaseDate != null
                                        ? Text(
                                            value.detailModel.releaseDate
                                                .toString(),
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffBBBBBB)),
                                          )
                                        : Shimmer.fromColors(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 2.h),
                                              height: 1.h,
                                              width: 25.w,
                                              color: Colors.amber,
                                            ),
                                            baseColor: Colors.grey.shade300
                                                .withOpacity(0.4),
                                            highlightColor: Colors.grey.shade500
                                                .withOpacity(0.4)),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    value.detailModel.productionCompanies![0]
                                                .originCountry !=
                                            null
                                        ? Text(
                                            "(${value.detailModel.productionCompanies![0].originCountry.toString()})",
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffBBBBBB)),
                                          )
                                        : Shimmer.fromColors(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 2.h),
                                              height: 1.h,
                                              width: 10.w,
                                              color: Colors.amber,
                                            ),
                                            baseColor: Colors.grey.shade300
                                                .withOpacity(0.4),
                                            highlightColor: Colors.grey.shade500
                                                .withOpacity(0.4)),
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      },
                    ),
                    Divider(
                      color: Color(0xff000000),
                      thickness: 0.2.h,
                    ),
                    Consumer<MovieDetailProvider>(
                      builder: (context, value, Widget) {
                        return value.detailModel.overview != null
                            ? Text(
                                value.detailModel.overview.toString(),
                                style: GoogleFonts.inter(
                                    fontSize: 2.h, color: Color(0xffCCCCCC)),
                              )
                            : Shimmer.fromColors(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 2.h,
                                      width: 80.w,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 70.w,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 75.w,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 80.w,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                  ],
                                ),
                                baseColor:
                                    Colors.grey.shade300.withOpacity(0.4),
                                highlightColor:
                                    Colors.grey.shade500.withOpacity(0.4));
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 6.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(60)),
                        child: Row(
                          children: [
                            Spacer(),
                            Image.asset(
                              "assets/play.png",
                              scale: 0.1.h,
                              color: Color(0xffFFFFFF),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Watch Trailer",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFFFFFF)),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Main Cast",
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Consumer<MovieCreditProvider>(
                      builder: (context, credit, Widget) {
                        return SizedBox(
                          height: 14.h,
                          width: 100.w,
                          child: ListView.builder(
                            itemCount: credit.creditModel.cast![0].profilePath!
                                .toString()
                                .length,
                            /* credit.creditModel.cast![0].name
                                .toString()
                                .length, */
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return credit.creditModel.cast![index]
                                          .profilePath !=
                                      null
                                  ? Container(
                                      height: 14.h,
                                      width: 37.w,

                                      //  margin: EdgeInsets.only(right: 4.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            //  margin: EdgeInsets.only(right: 4.w),
                                            height: 10.h,
                                            width: 18.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 0.5.w,
                                                    color: Color.fromARGB(
                                                        255, 73, 71, 71)),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${credit.creditModel.cast![index].profilePath}"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          /* CircleAvatar(
                                      radius: 40,
                                      child: Image(
                                        image: NetworkImage(
                                            "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${credit.creditModel.cast![index].profilePath}"),
                                        fit: BoxFit.fill,
                                      ),
                                    ) */
                                          SizedBox(
                                            height: 2.h,
                                            width: double.infinity,
                                            child: FittedBox(
                                              child: Text(
                                                credit.creditModel.cast![index]
                                                    .name
                                                    .toString(),
                                                style: GoogleFonts.inter(
                                                    color: Color(0xffFFFFFF)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Shimmer.fromColors(
                                      child: Container(
                                        height: 14.h,
                                        width: 37.w,

                                        //  margin: EdgeInsets.only(right: 4.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              //  margin: EdgeInsets.only(right: 4.w),
                                              height: 10.h,
                                              width: 18.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 0.5.w,
                                                ),
                                              ),
                                              child: Image.asset(
                                                  "assets/noimage.png"),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                              width: double.infinity,
                                              child: FittedBox(
                                                child: Text(
                                                  credit.creditModel
                                                      .cast![index].name
                                                      .toString(),
                                                  style: GoogleFonts.inter(
                                                      color: Color(0xffFFFFFF)),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      /* Container(
                                        
                                        height: 10.h,
                                        width: 18.w,
                                        margin: EdgeInsets.only(right: 5.w, bottom: 4.h),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                         // color: Colors.amber,
                                        ),
                                        child: Image.asset("assets/noimage.png"),
                                      ), */
                                      baseColor:
                                          Colors.grey.shade300.withOpacity(0.4),
                                      highlightColor: Colors.grey.shade500
                                          .withOpacity(0.4));
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Categories",
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Consumer<MovieDetailProvider>(
                      builder: (context, creditCategory, Widget) {
                        return Container(
                          height: 4.h,
                          width: 100.w,
                          decoration: BoxDecoration(),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                creditCategory.detailModel.genres!.length,
                            itemBuilder: (context, index) {
                              return creditCategory.detailModel.genres != null
                                  ? Container(
                                      margin: EdgeInsets.only(right: 2.w),
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color(0xff303243)),
                                      child: Center(
                                        child: FittedBox(
                                          child: Text(
                                            creditCategory
                                                .detailModel.genres![index].name
                                                .toString(),
                                            style: GoogleFonts.inter(
                                                fontSize: 15,
                                                color: Color(0xffFFFFFF),
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Shimmer.fromColors(
                                      child: Container(
                                        height: 3.h,
                                        width: 20.w,
                                        margin: EdgeInsets.only(right: 5.w),
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      baseColor:
                                          Colors.grey.shade300.withOpacity(0.4),
                                      highlightColor: Colors.grey.shade500
                                          .withOpacity(0.4));
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                      width: 100.w,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
