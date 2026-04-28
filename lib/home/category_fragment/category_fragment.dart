import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/category_fragment/category_item.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

import '../../Utils/screen_utils.dart';
import '../../providers/theme_provider.dart';

class CategoryFragment extends StatelessWidget {
  const CategoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    final themeProvider = Provider.of<ThemeProvider>(context);

    final categoriesList = Category.getCategoriesList(
      isDark: themeProvider.isDark,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'good-morning'.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          SizedBox(height: height * 0.02),

          

          SizedBox(height: height * 0.02),

          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return CategoryItem(
                  category: categoriesList[index] , index: index,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}