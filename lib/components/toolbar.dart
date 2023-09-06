import 'package:dilewar/styles/app_colors.dart';
import 'package:dilewar/styles/app_texts.dart';
import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const Toolbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppText.header2,
      ),
      actions: actions,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
