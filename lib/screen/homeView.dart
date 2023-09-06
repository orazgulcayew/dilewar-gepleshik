import 'package:dilewar/components/Card.dart';
import 'package:dilewar/components/toolbar.dart';
import 'package:dilewar/config/app_Strings.dart';
import 'package:dilewar/data.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Toolbar(
          title: AppStrings.appName,
          actions: [Icon(Icons.more_vert_rounded)],
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
