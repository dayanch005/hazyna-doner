import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleLangProvider extends ChangeNotifier {
  Locale locale = const Locale('tr');

  LocaleLangProvider() {
    _loadLocale();
  }

  void _loadLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');

    if (languageCode != null) {
      locale = Locale(languageCode);
    } else {
      locale = const Locale('tr');
    }
    notifyListeners();
  }

  void setLocale(Locale local) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    locale = local;
    notifyListeners();

    await prefs.setString('languageCode', local.languageCode);
  }
}

