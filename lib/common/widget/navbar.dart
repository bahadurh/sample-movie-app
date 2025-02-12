import 'package:flutter/material.dart';

import '../../core/app_style.dart';

class AppBottomNavBar extends StatelessWidget {
  /// The index of the currently selected item.
  final int currentIndex;

  /// Callback when an item is tapped.
  final ValueChanged<int>? onTap;

  /// List of navigation items.
  final List<AppBottomNavBarItem> items;

  /// Background color of the navigation bar.
  final Color backgroundColor;

  /// Shadow effect for the navigation bar.
  final List<BoxShadow>? boxShadow;

  /// Border radius of the navigation bar.
  final double borderRadius;

  /// Height of the navigation bar.
  final double height;

  /// Padding for the navigation bar.
  final EdgeInsets padding;

  /// Whether to show labels for unselected items.
  final bool showUnselectedLabels;

  /// Whether to show labels for selected items.
  final bool showSelectedLabels;

  /// Constructor
  const AppBottomNavBar({
    required this.currentIndex,
    required this.items,
    super.key,
    this.onTap,
    this.backgroundColor = AppColors.purpleDark,
    this.boxShadow,
    this.borderRadius = 27.0,
    this.height = 60.0,
    this.padding = const EdgeInsets.all(10.0),
    this.showUnselectedLabels = false,
    this.showSelectedLabels = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
        ),
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            onTap: onTap,
            backgroundColor: Colors.transparent,
            showUnselectedLabels: showUnselectedLabels,
            showSelectedLabels: showSelectedLabels,
            unselectedIconTheme: IconThemeData(color: AppColors.greyDark),
            selectedIconTheme: IconThemeData(color: AppColors.white),
            items: items,
            currentIndex: currentIndex,
          ),
        ),
      ),
    );
  }
}

/// Represents an item in the AppBottomNavBar.
class AppBottomNavBarItem extends BottomNavigationBarItem {
  /// Icon when the item is inactive.
  final Widget icon;

  /// Icon when the item is active.
  final Widget? activeIco;

  /// Background color for the item.
  final Color? backgroundColor;

  /// Label for the item.
  final String label;

  /// Tooltip for accessibility.
  @override
  final String? tooltip;

  /// Constructor
  AppBottomNavBarItem({
    required this.icon,
    this.backgroundColor,
    required this.label,
    this.tooltip,
    this.activeIco,
  }) : super(
          icon: icon,
          activeIcon: activeIco ?? icon,
          backgroundColor: backgroundColor,
          label: label,
          tooltip: tooltip,
        );
}
