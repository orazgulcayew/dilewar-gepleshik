import 'package:dilewar/models/translation.dart';

class CategoryItem {
  final Translatioin category;
  final List<Translatioin> items;

  CategoryItem({required this.category, required this.items});

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    final category = Translatioin.fromJson(json['category']);
    final itemsList = json['items'] as List<dynamic>;
    final items = itemsList.map((item) => Translatioin.fromJson(item)).toList();

    return CategoryItem(category: category, items: items);
  }
}
