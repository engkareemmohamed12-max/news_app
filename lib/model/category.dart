import 'package:easy_localization/easy_localization.dart';
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
        title: 'general'.tr(),
        image: isDark
            ? AppAssets.generalLight
            : AppAssets.generalDark,
      ),
      Category(
        id: 'business',
        title: 'business'.tr(),
        image: isDark
            ? AppAssets.busniessLight
            : AppAssets.busniessDark,
      ),
      Category(
        id: 'sports',
        title: 'sport'.tr(),
        image: isDark
            ? AppAssets.sportLight
            : AppAssets.sportDark,
      ),

      Category(
        id: 'technology',
        title: 'technology'.tr(),
        image: isDark
            ? AppAssets.technologyLight
            : AppAssets.technologyDark,
      ),

      Category(
        id: 'entertainment',
        title: 'entertainment'.tr(),
        image: isDark
            ? AppAssets.entertainmentLight
            : AppAssets.entertainmentDark,
      ),
      Category(
        id: 'health',
        title: 'health'.tr(),
        image: isDark
            ? AppAssets.healthLight
            : AppAssets.healthDark,
      ),

      Category(
        id: 'science',
        title: 'science'.tr(),
        image: isDark
            ? AppAssets.scienceLight
            : AppAssets.scienceDark,
      ),



    ];
  }
}