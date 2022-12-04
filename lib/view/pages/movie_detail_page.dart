import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../provider/movie_detail_page_providers/movie_detail_provider.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.film_id});
  final int film_id;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    MovieDetailProvider? data2;
    data2 = Provider.of<MovieDetailProvider>(context, listen: false);
    data2.getIdChance(widget.film_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303243),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xff303243),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<MovieDetailProvider>(
              builder: (context, value, Widget) {
                return Container(
                  height: 55.h,
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
                        padding: EdgeInsets.only(bottom: 45.h, left: 5.w),
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
                                  fontSize: 16, color: Color(0xffFFFFFF)),
                            )
                          ],
                        ),
                      )),
                );
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
                          CircularPercentIndicator(
                              radius: 10.w,
                              arcType: ArcType.FULL,
                              arcBackgroundColor: Color(0xff15161D),
                              lineWidth: 1.w,
                              progressColor: Color(0xffFF1F8A),
                              percent:
                                  (value.detailModel.voteAverage * 10) / 100,
                              center: Text(
                                "${value.detailModel.voteAverage.toStringAsFixed(1)}/10",
                                style: GoogleFonts.inter(
                                    fontSize: 15, color: Color(0xffFFFFFF)),
                              )),
                          SizedBox(
                            width: 5.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                value.detailModel.title.toString(),
                                style: GoogleFonts.inter(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                              Row(
                                children: [
                                  Text(
                                    value.detailModel.releaseDate.toString(),
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffBBBBBB)),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    "(${value.detailModel.productionCompanies![0].originCountry.toString()})",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffBBBBBB)),
                                  ),
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
                      return Text(
                        value.detailModel.overview.toString(),
                        style: GoogleFonts.inter(
                            fontSize: 2.h, color: Color(0xffCCCCCC)),
                      );
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
                      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(60)),
                      child: Row(
                        children: [
                          Spacer(),
                          Image.asset("assets/play.png", scale: 0.1.h, color: Color(0xffFFFFFF),),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Watch Trailer",style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text("Main Cast", style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF)),),
                  SizedBox(
                    height: 2.h,
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
