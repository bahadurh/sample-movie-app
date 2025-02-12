import 'package:flutter/material.dart';

import '../../core/app_style.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final TextStyle? titleTextStyle;
  final bool shouldHaveBorder;
  final PreferredSizeWidget? bottom;
  final isDarkMode = false;
  final IconThemeData? iconTheme;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor = Colors.white,
    this.titleTextStyle = textStyle16MediumSemiWhite,
    this.bottom,
    this.shouldHaveBorder = true,
    this.iconTheme,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      iconTheme: iconTheme,
      title: Text(title, style: titleTextStyle),
      shape: shouldHaveBorder ? Border(bottom: BorderSide(color: AppColors.greySemiLight, width: 1)) : null,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
