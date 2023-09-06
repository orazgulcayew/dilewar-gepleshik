import 'package:dilewar/styles/app_colors.dart';
import 'package:dilewar/styles/app_texts.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String title;
  final IconData icon;
  const CardView({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // How far the shadow spreads
              blurRadius: 5, // How blurry the shadow is
              offset: Offset(0, 0), // Offset of the shadow
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 32,
            color: AppColors.white,
          ),
          Text(title, style: AppText.subtitle1),
        ],
      ),
    );
  }
}
