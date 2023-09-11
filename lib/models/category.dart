import 'package:dilewar/models/translation.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class CategoryItem {
  @HiveField(0)
  final Translatioin category;
  @HiveField(1)
  final List<Translatioin> items;

  CategoryItem({required this.category, required this.items});

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    final category = Translatioin.fromJson(json['category']);
    final itemsList = json['items'] as List<dynamic>;
    final items = itemsList.map((item) => Translatioin.fromJson(item)).toList();

    return CategoryItem(category: category, items: items);
  }
}
