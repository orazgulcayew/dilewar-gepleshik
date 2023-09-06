import 'package:dilewar/styles/app_colors.dart';
import 'package:dilewar/widgets/card.dart';
import 'package:dilewar/config/app_Strings.dart';
import 'package:dilewar/data.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
          actions: const [Icon(Icons.more_vert_rounded)],
          backgroundColor: AppColors.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  child: GridView.builder(
                itemCount: itemList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25.0,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 18.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final item = itemList[index];
                  return CardView(
                    title: item['title'],
                    icon: item['icon'],
                  );
                },
              )),
            ],
          ),
        ));
  }
}
