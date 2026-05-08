import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_styles.dart';

import '../Utils/screen_utils.dart';

class DrawerItem extends StatelessWidget {
  final String iconName ;
  final String name ;
  const DrawerItem({super.key , required this.iconName , required this.name});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.02
      ),
      child: Row(
        spacing: width*0.02,
        children: [

          Image.asset(iconName),
          Text(name , style: AppStyle.bold20White,),

        ],
      ),
    );
  }
}
