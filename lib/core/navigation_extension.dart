import 'package:dilewar/models/category.dart';
import 'package:dilewar/screen/conversation_view.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void openConversation(CategoryItem categoryItem) {
    Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => ConversationView(categoryItem: categoryItem),
        ));
  }
}
