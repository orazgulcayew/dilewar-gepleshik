import 'package:dilewar/main.dart';
import 'package:dilewar/widgets/translation_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text("Halanlarym"),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          if (value.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )),
                  const Gap(12),
                  const Text(
                    "Häzirlikçe halanlarym boş",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: value.length,
            itemBuilder: (context, index) {
              final item = value.getAt(index);
              final key = "${item.english}:${item.id}";

              return TranslationCard(
                  item: item,
                  onTap: () {
                    box.delete(key);
                  },
                  isSaved: true);
            },
          );
        },
      ),
    );
  }
}
