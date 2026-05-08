import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_app/Utils/app_assets.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/Utils/app_styles.dart';
import 'package:news_app/drawer/config_option.dart';
import 'package:news_app/drawer/divider_item.dart';
import 'package:news_app/drawer/drawer_item.dart';

import '../Utils/screen_utils.dart';
import '../providers/theme_provider.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onDrawerItemClick ;
  const HomeDrawer({super.key , required this.onDrawerItemClick});

  void _showMenu(
      BuildContext context,
      GlobalKey key,
      List<PopupMenuEntry<String>> items,
      void Function(String value) onSelected,
      ) async {
    final renderBox =
    key.currentContext!.findRenderObject() as RenderBox;

    final offset = renderBox.localToGlobal(Offset.zero);

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + renderBox.size.height,
        0,
        0,
      ),
      items: items,
    );

    if (selected != null) {
      onSelected(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;

    final themeKey = GlobalKey();
    final langKey = GlobalKey();

    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      spacing: height * 0.02,
      children: [
        Container(
          alignment: Alignment.center,
          color: AppColors.whiteColor,
          height: height * 0.18,
          child: Text(
            'new'.tr(),
            style: AppStyle.bold24Black,
          ),
        ),

        InkWell(
          onTap: (){
            onDrawerItemClick();
          },
          child: DrawerItem(
            iconName: AppAssets.homeIcon,
            name: 'go-to-home'.tr(),
          ),
        ),

        DividerItem(),



        DrawerItem(
          iconName: AppAssets.themeIcon,
          name: 'theme'.tr(),
        ),

        ConfigOption(
          key: themeKey,
          name: themeProvider.isDark
              ? 'dark'.tr()
              : 'light'.tr(),
          onPressed: () {
            _showMenu(
              context,
              themeKey,
              [
                PopupMenuItem(
                  value: 'light',
                  child: Text('light'.tr()),
                ),
                PopupMenuItem(
                  value: 'dark',
                  child: Text('dark'.tr()),
                ),
              ],
                  (value) {
                if (value == 'dark') {
                  themeProvider.changeTheme(ThemeMode.dark);
                } else {
                  themeProvider.changeTheme(ThemeMode.light);
                }
              },
            );
          },
        ),

        DividerItem(),

        DrawerItem(
          iconName: AppAssets.langaugeIcon,
          name: 'language'.tr(),
        ),

        ConfigOption(
          key: langKey,
          name: context.locale.languageCode == 'en'
              ? 'English'
              : 'العربية',
          onPressed: () {
            _showMenu(
              context,
              langKey,
              [
                PopupMenuItem(
                  value: 'en',
                  child: Text('english'.tr()),
                ),
                PopupMenuItem(
                  value: 'ar',
                  child: Text('arabic'.tr()),
                ),
              ],
                  (value) {
                if (value == 'en') {
                  context.setLocale(const Locale('en'));
                } else {
                  context.setLocale(const Locale('ar'));
                }
              },
            );
          },
        ),
      ],
    );
  }
}