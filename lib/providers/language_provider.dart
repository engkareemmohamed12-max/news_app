import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageProvider extends ChangeNotifier {

  String appLanguage = 'en';

  void changeLanguage(BuildContext context, String newLanguage) {

    if (appLanguage == newLanguage) return;

    appLanguage = newLanguage;

    context.setLocale(Locale(newLanguage));

    notifyListeners();
  }
}