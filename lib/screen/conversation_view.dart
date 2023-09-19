import 'package:dilewar/core/string_extension.dart';
import 'package:dilewar/main.dart';
import 'package:dilewar/models/category.dart';
import 'package:dilewar/models/translation.dart';
import 'package:dilewar/widgets/translation_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/search_input.dart';

class ConversationView extends StatefulWidget {
  final CategoryItem categoryItem;
  const ConversationView({super.key, required this.categoryItem});

  @override
  State<ConversationView> createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  List<Translatioin> translations = [];

  @override
  void initState() {
    super.initState();

    translations.addAll(widget.categoryItem.items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title:
            Text(widget.categoryItem.category.turkmen.capitalizeFirstLetter()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchInput(
                onChanged: (value) {
                  filterList(value);
                },
                hintText: "Gözle..."),
            const Gap(12),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: translations.length,
                      itemBuilder: (context, index) {
                        final item = translations[index];
                        final key = "${item.english}:${item.id}";

                        return TranslationCard(
                          item: item,
                          isSaved: box.containsKey(key),
                          onTap: () {
                            box.containsKey(key)
                                ? box.delete(key)
                                : box.put(key, item);
                          },
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  filterList(String value) {
    List<Translatioin> tempList = [];

    if (value.isNotEmpty) {
      for (var translation in widget.categoryItem.items) {
        if (translation.english.toLowerCase().contains(value) ||
            translation.turkmen.toLowerCase().contains(value) ||
            translation.italian.toLowerCase().contains(value)) {
          tempList.add(translation);
        }
      }
    } else {
      tempList = widget.categoryItem.items;
    }
    setState(() {
      translations = tempList;
    });
  }
}
