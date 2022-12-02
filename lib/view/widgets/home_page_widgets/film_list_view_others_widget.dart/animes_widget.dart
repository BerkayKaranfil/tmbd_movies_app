import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../provider/home_page_providers/category_list_provider.dart';

class AnimesCategory extends StatelessWidget {
  const AnimesCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, value, widget) {
      return Container(
        height: 23.h,
        width: 100.w,
        decoration: BoxDecoration(color: Colors.blue),
      );
    },);
  }
}