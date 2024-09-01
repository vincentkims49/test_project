import 'package:flutter/material.dart';
import 'package:test_project/core/constants/colors.dart';
import 'package:test_project/core/constants/text_styles.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const ResponsiveAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double iconSize = screenWidth * 0.05;

    return AppBar(
      backgroundColor: Colors.white,
      leading: leading ??
          IconButton(
            icon: Icon(
              Icons.menu,
              size: iconSize,
            ),
            onPressed: () {},
          ),
      title: Text(
        title,
        style: AppTextStyles.regular16(context).copyWith(
          color: AppColors.textColor,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
