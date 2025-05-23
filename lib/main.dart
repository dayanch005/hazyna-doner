import 'package:flutter/material.dart';
import 'package:hazyna_doner/app_setting.dart';
import 'package:hazyna_doner/hive_helper/register_adapters.dart';
import 'package:hazyna_doner/menu.dart';
import 'package:hazyna_doner/provider/lang_provider.dart';
import 'package:hazyna_doner/provider/shopping_provider.dart';
import 'package:hazyna_doner/provider/theme_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'menu_page/menu_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  registerAdapters();
  await Hive.openBox('moviesBox');
  await Hive.openBox('settings');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => ShoppingProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocaleLangProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Provider.of<LocaleLangProvider>(context).locale,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      title: 'Iki nokat yakyn.com',
      theme: ThemeData.light(),
      home: const Menu(),
    );
  }
}

