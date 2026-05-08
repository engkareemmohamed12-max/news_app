import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';

import '../Utils/screen_utils.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Divider(
      color: AppColors.whiteColor,
      endIndent: width*0.06,
      indent: width*0.06,
      thickness: 2,
    );
  }
}
