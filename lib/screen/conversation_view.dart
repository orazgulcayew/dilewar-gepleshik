import 'package:dilewar/core/string_extension.dart';
import 'package:dilewar/main.dart';
import 'package:dilewar/models/category.dart';
import 'package:dilewar/widgets/translation_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConversationView extends StatelessWidget {
  final CategoryItem categoryItem;
  const ConversationView({super.key, required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(categoryItem.category.turkmen.capitalizeFirstLetter()),
      ),
      body: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, value, child) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: categoryItem.items.length,
              itemBuilder: (context, index) {
                final item = categoryItem.items[index];
                final key = "${item.english}:${item.id}";

                return TranslationCard(
                  item: item,
                  isSaved: box.containsKey(key),
                  onTap: () {
                    box.containsKey(key) ? box.delete(key) : box.put(key, item);
                  },
                );
              },
            );
          }),
    );
  }
}
