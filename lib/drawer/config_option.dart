import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/Utils/app_styles.dart';

import '../Utils/screen_utils.dart';

class ConfigOption extends StatelessWidget {
  final String name ;
  final VoidCallback onPressed ;
  const ConfigOption({super.key , required this.name , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width*0.04
      ),
      padding: EdgeInsets.symmetric(
          horizontal: width*0.02,
        vertical: height*0.001
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 2
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name , style: AppStyle.medium20White,),
          IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_drop_down , size: 35, color: AppColors.whiteColor,))
        ],
      ),
    );
  }
}
