import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/model/category.dart';

import '../../Utils/screen_utils.dart';

class CategoryItem extends StatefulWidget {
  final Category category ;
  final int index ;
  const CategoryItem({super.key , required this.category , required this.index});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    var isEven = widget.index%2 == 0 ;
    var width = context.width;
    var height = context.height;
    return Stack(
      alignment: isEven? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(24),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(widget.category.image),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: width*0.02,
            vertical: height*0.02
          ),
          padding: EdgeInsetsDirectional.only(
            start: isEven ? width*0.04 : 0,
            end: isEven ? 0 : width*0.04
          ),
          decoration: BoxDecoration(
            color: AppColors.greyColor,
            borderRadius: BorderRadiusGeometry.circular(24),
          ),
          child: Row(
            spacing: width*0.02,
            mainAxisSize: MainAxisSize.min,
            textDirection: isEven ? TextDirection.ltr : TextDirection.rtl ,
            children: [
              Text( 'View all' , style: Theme.of(context).textTheme.headlineMedium, ),
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon( isEven? Icons.arrow_forward_ios : Icons.arrow_back_ios_new_outlined , color:
                Theme.of(context).splashColor,),
              )
            ],
          ),
        ),
      ],
    );
  }
}
