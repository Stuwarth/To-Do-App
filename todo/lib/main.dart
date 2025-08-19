import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/ui/pages/home_page.dart';
import 'package:todo/ui/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'db/db_helper.dart';

//future
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize DB and storage
  await DBHelper.initDb();
  await GetStorage.init();
  // Initialize date/locale data for Spanish
  await initializeDateFormatting('es', null);
  Intl.defaultLocale = 'es';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: 'Tareas',
      // Force Spanish locale so DateFormat and widgets show Spanish labels
      locale: const Locale('es', 'ES'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('es', 'ES')],
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
