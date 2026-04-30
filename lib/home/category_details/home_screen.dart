import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/home/category_fragment/category_fragment.dart';
import 'package:news_app/model/category.dart';



class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home' , style: Theme.of(context).textTheme.headlineLarge,),),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(),
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
}
