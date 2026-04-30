import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/Utils/app_styles.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

import '../../Utils/screen_utils.dart';
import '../../providers/theme_provider.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  final int index;
  const CategoryItem({super.key, required this.category, required this.index});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var isEven = widget.index % 2 == 0;
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    var width = context.width;
    var height = context.height;

    return Stack(
      alignment: isEven ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(widget.category.image),
        ),

        Positioned(
          top: 16,
          left: isEven ? null : 16,
          right: isEven ? 16 : null,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.02
            ),
            child: Text(
                widget.category.title,
                style: themeProvider.isDark ? AppStyle.bold32Black : AppStyle.bold32White
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.02
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.greyColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,

            textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
            children: [
              Text(
                isRtl ? 'عرض الكل' : 'View all',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  _getArrowIcon(isEven, isRtl),
                  color: Theme.of(context).splashColor,
                  size: 16,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  IconData _getArrowIcon(bool isEven, bool isRtl) {
    if (isEven) {
      return isRtl ? Icons.arrow_back_ios_new_outlined : Icons.arrow_forward_ios;
    } else {
      return isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios_new_outlined;
    }
  }
}