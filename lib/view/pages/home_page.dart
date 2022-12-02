import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tmbd_movies_app/provider/home_page_providers/film_list_view_provider.dart';

import '../widgets/home_page_widgets/category_text_list_widget.dart';
import '../widgets/home_page_widgets/film_list_view_widget.dart';
import '../widgets/home_page_widgets/text_form_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FilmListViewProvider? data;

  @override
  void initState() {
    
    super.initState();
    data = Provider.of<FilmListViewProvider>(context, listen: false);
    data!.getTopRatedFilm();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff8000FF), Color(0xff000000)])),
        child: Padding(
          padding: EdgeInsets.only(right: 5.w, left: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "What do you want to watch today?",
                    style: GoogleFonts.inter(fontSize: 17),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: Image.asset("assets/profileimage.png"),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextFormWidget(),
              SizedBox(
                height: 2.h,
              ),
              CategoryTextListWidget(),
              SizedBox(
                height: 2.h,
              ),

              FilmListviewWidget()
            ],
          ),
        ),
      ),
    );
  }
}

