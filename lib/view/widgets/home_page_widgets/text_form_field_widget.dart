import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              hintText: "Ne dinlemek istiyorsun?",
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
    );
  }
}
