import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/translation.dart';
import '../styles/app_colors.dart';

class TranslationCard extends StatelessWidget {
  const TranslationCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.isSaved,
  });

  final Translatioin item;

  final Function() onTap;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        elevation: 1,
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "🇹🇲 ${item.turkmen}",
                    style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                IconButton(
                    onPressed: onTap,
                    icon: isSaved
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_outline))
              ],
            ),
            const Divider(
              height: 12,
            ),
            Text(
              "🇬🇧 ${item.english}",
              style: const TextStyle(fontSize: 15),
            ),
            const Gap(4),
            Text(
              "🇮🇹 ${item.italian}",
              style: const TextStyle(fontSize: 15),
            ),
          ]),
        ),
      ),
    );
  }
}
