import 'package:news_app/Utils/app_assets.dart';

class Category {
  String id;
  String title;
  String image;

  Category({
    required this.id,
    required this.title,
    required this.image,
  });


  /* business entertainment  health science sports technology */

  static List<Category> getCategoriesList({required bool isDark}) {
    return [
      Category(
        id: 'general',
        title: 'General',
        image: isDark
            ? AppAssets.generalLight
            : AppAssets.generalDark,
      ),
      Category(
        id: 'business',
        title: 'Business',
        image: isDark
            ? AppAssets.busniessLight
            : AppAssets.busniessDark,
      ),
      Category(
        id: 'sports',
        title: 'Sports',
        image: isDark
            ? AppAssets.sportLight
            : AppAssets.sportDark,
      ),

      Category(
        id: 'technology',
        title: 'Technology',
        image: isDark
            ? AppAssets.technologyLight
            : AppAssets.technologyDark,
      ),

      Category(
        id: 'entertainment',
        title: 'Entertainment',
        image: isDark
            ? AppAssets.entertainmentLight
            : AppAssets.entertainmentDark,
      ),
      Category(
        id: 'health',
        title: 'Health',
        image: isDark
            ? AppAssets.healthLight
            : AppAssets.healthDark,
      ),

      Category(
        id: 'science',
        title: 'Science',
        image: isDark
            ? AppAssets.scienceLight
            : AppAssets.scienceDark,
      ),



    ];
  }
}