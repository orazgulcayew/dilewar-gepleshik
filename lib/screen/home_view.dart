import 'dart:convert';

import 'package:dilewar/core/navigation_extension.dart';
import 'package:dilewar/models/category.dart';
import 'package:dilewar/widgets/card.dart';
import 'package:dilewar/config/app_Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryItem> categories = [];
  bool isLoaded = false;

  List<IconData> categoryIcons = [
    Icons.business_outlined, // GENERAL
    Icons.chat_outlined, // GREETING
    Icons.work_outline, // PROFESSION
    Icons.airport_shuttle_outlined, // IN AIRPORT
    Icons.local_hospital_outlined, // AT THE HOSPITAL
    Icons.local_pharmacy_outlined, // IN A PHARMACY
    Icons.call_outlined, // TELECOMMUNICATION
    Icons.theaters_outlined, // AT THE THEATRE
    Icons.museum_outlined, // AT THE MUSEUM
    Icons.restaurant_outlined, // IN A RESTAURANT
    Icons.library_books_outlined, // AT THE LIBRARY
    Icons.hotel_outlined, // AT THE HOTEL
    Icons.directions_bus_outlined, // AT THE BUS STATION
    Icons.train_outlined, // AT THE STATION
    Icons.location_city_outlined, // IN THE CITY
    Icons.directions_car_outlined, // IN THE CAR
    Icons.sports_soccer_outlined, // SPORT
  ];

  List<Color?> cardBackgroundColors = [
    Colors.blue[100],
    Colors.green[100],
    Colors.red[100],
    Colors.orange[100],
    Colors.purple[100],
    Colors.teal[100],
    Colors.amber[100],
    Colors.indigo[100],
    Colors.deepOrange[100],
    Colors.pink[100],
    Colors.brown[100],
    Colors.lightBlue[100],
    Colors.lime[100],
    Colors.cyan[100],
    Colors.deepPurple[100],
    Colors.yellow[100],
    Colors.green[100],
  ];

  @override
  void initState() {
    super.initState();
    loadJson().then((list) {
      setState(() {
        for (var element in list) {
          categories.add(CategoryItem.fromJson(element));
        }
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
              onPressed: () {
                context.openFavorites();
              },
              icon: const Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
        ],
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (BuildContext context, int index) {
                final item = categories[index];

                return CategoryCard(
                  title: item.category.turkmen,
                  icon: categoryIcons[index],
                  onTap: () {
                    context.openConversation(item);
                  },
                  color: cardBackgroundColors[index] ?? Colors.white,
                );
              },
            )),
          ],
        ),
      ),
    );
  }

  Future<dynamic> loadJson() async {
    final json = await rootBundle.loadString('assets/conversations_it.json');

    return jsonDecode(json);
  }
}
