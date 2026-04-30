import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/category_fragment/category_item.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

import '../../Utils/screen_utils.dart';
import '../../providers/theme_provider.dart';


typedef OnCategoryClick = void Function(Category);

class CategoryFragment extends StatelessWidget {
  final OnCategoryClick onCategoryClick ;
  const CategoryFragment({super.key , required this.onCategoryClick});

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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height*0.02,
          children: [
            Text(
              'good-morning'.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                    onCategoryClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                    category: categoriesList[index] , index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: categoriesList.length,
            ),
          ],
        ),
      ),
    );
  }
}