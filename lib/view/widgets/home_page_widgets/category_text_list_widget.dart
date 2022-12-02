import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../provider/home_page_providers/category_list_provider.dart';

class CategoryTextListWidget extends StatelessWidget {
  const CategoryTextListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, value, Widget) {
        return Container(
          height: 5.h,
          width: 100.w,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(right: 1.w),
                child: GestureDetector(
                  onTap: () {
                    value.categoryIndex = index;
                    //  value.textCategoryChance();
                    value.changeText(index);
                  },
                  child: Container(
                      height: 3.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: value.categoryIndex == index
                        ? Color(0xffFF1F8A)
                        : Colors.transparent
                      ),
                      // color: Colors.blue,
                      child: Center(
                        child: Text(
                          value.category[index],
                          style: GoogleFonts.inter(
                              fontSize: 2.1.h,
                              fontWeight: FontWeight.w500,
                              color: value.categoryIndex == index
                              ? Colors.white
                              : Colors.grey
                              ),
                        ),
                      )
                      /* Column(
                  children: [
                    Text(
                      value.category[index],
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: value.categoryIndex == index
                              ? Color(0xff000000)
                              : Color(0xffBEBEBE)),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 0.6.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          color: value.categoryIndex == index
                              ? Colors.green
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                    )
                  ],
                ), */
                      ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
