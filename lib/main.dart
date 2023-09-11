import 'package:dilewar/config/app_strings.dart';
import 'package:dilewar/models/category.dart';
import 'package:dilewar/models/translation.dart';
import 'package:dilewar/screen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

late Box box;

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TranslatioinAdapter());
  Hive.registerAdapter(CategoryItemAdapter());

  box = await Hive.openBox<Translatioin>('favorites');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.green,
          useMaterial3: true,
        ),
        home: const HomeView());
  }
}
