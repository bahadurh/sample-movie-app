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
  final bool disableLeading;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor = Colors.white,
    this.titleTextStyle = textStyle16MediumSemiWhite,
    this.bottom,
    this.shouldHaveBorder = true,
    this.iconTheme,
    this.disableLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: disableLeading ? false : true,
      leading: disableLeading
          ? null
          : Navigator.of(context).canPop()
              ? IconButton(
                  onPressed: () {
                    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
                  },
                  icon: isDarkMode
                      ? const Icon(Icons.arrow_back_ios, color: Colors.white)
                      : const Icon(Icons.arrow_back_ios, color: Colors.black))
              : null,
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
