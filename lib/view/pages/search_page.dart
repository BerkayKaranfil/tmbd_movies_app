import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                  /*  IconButton(onPressed: () {
                    
                  }, icon: Image.asset("assets/return2.png", scale: 0.1.h,)), */
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
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff36076B),
                    borderRadius: BorderRadius.circular(32)),
                child: TextFormField(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));
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
                          borderSide:
                              BorderSide(color: Color(0xff222222), width: 1),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff222222),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(32)),
                        focusColor: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
