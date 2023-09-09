import 'package:dilewar/core/string_extension.dart';
import 'package:dilewar/models/category.dart';
import 'package:flutter/material.dart';

class ConversationView extends StatelessWidget {
  final CategoryItem categoryItem;
  const ConversationView({super.key, required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryItem.category.english.capitalizeFirstLetter()),
      ),
      body: ListView.builder(
        itemCount: categoryItem.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categoryItem.items[index].english),
            onTap: () {},
          );
        },
      ),
    );
  }
}
