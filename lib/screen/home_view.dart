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
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.language_rounded)),
        ],
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
            itemCount: itemList.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (BuildContext context, int index) {
              final item = itemList[index];
              return CategoryCard(
                title: item['title'],
                icon: item['icon'],
                onTap: () {},
                color: AppColors.categoryColors[index] ?? Colors.black,
              );
            },
          )),
        ],
      ),
    );
  }
}
