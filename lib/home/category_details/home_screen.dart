import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/Utils/app_route.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/home/category_fragment/category_fragment.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';



class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.searchRouteName);
            },
            icon: Icon(
              Icons.search,
              color: themeProvider.isDark ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerItemClick: onDrawerItemClick,),
      ),
      body: selectedCategory == null ?
      CategoryFragment(onCategoryClick: onCategoryClick,) : CategoryDetails(category: selectedCategory!,),
    );
  }

  Category? selectedCategory ;

  void onCategoryClick(Category newSelectedCategory){

    //todo : newSelectedCategory => user

    selectedCategory = newSelectedCategory ;

    setState(() {

    });
  }

  void onDrawerItemClick(){

    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });

  }
}
