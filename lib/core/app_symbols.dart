import '../common/widget/app_svg.dart';

abstract interface class SymbolPaths {
  static const String closeIcon = 'assets/ic/ic_close.svg';
  static const String findIcon = 'assets/ic/ic_find.svg';
  static final path = 'assets/ic/navbar';

  /// navbar
  static const String dashboardActiveIcon = 'assets/ic/navbar/ic_dashboard_active.svg';
  static const String watchActiveIcon = 'assets/ic/navbar/ic_watch_active.svg';
  static const String mediaLibraryActiveIcon = 'assets/ic/navbar/ic_media_library_active.svg';
  static const String moreActiveIcon = 'assets/ic/navbar/ic_more_active.svg';

  static const String dashboardDisabledIcon = 'assets/ic/navbar/ic_dashboard_disabled.svg';
  static const String watchDisabledIcon = 'assets/ic/navbar/ic_watch_disabled.svg';
  static const String mediaLibraryDisabledIcon = 'assets/ic/navbar/ic_media_library_disabled.svg';
  static const String moreDisabledIcon = 'assets/ic/navbar/ic_more_disabled.svg';
}

abstract interface class Symbols {
  static const AppSvgAsset closeIcon = AppSvgAsset(SymbolPaths.closeIcon);
  static const AppSvgAsset findIcon = AppSvgAsset(
    SymbolPaths.findIcon,
    height: 60,
    width: 40,
  );

  /// navbar
  static const AppSvgAsset dashboardActiveIcon = AppSvgAsset(SymbolPaths.dashboardActiveIcon, height: 20, width: 20);
  static const AppSvgAsset watchActiveIcon = AppSvgAsset(SymbolPaths.watchActiveIcon, height: 20, width: 20);
  static const AppSvgAsset mediaLibraryActiveIcon = AppSvgAsset(SymbolPaths.mediaLibraryActiveIcon, height: 20, width: 20);
  static const AppSvgAsset moreActiveIcon = AppSvgAsset(SymbolPaths.moreActiveIcon, height: 24, width: 24);

  static const AppSvgAsset dashboardDisabledIcon = AppSvgAsset(SymbolPaths.dashboardDisabledIcon, height: 20, width: 20);
  static const AppSvgAsset watchDisabledIcon = AppSvgAsset(SymbolPaths.watchDisabledIcon, height: 20, width: 20);
  static const AppSvgAsset mediaLibraryDisabledIcon = AppSvgAsset(SymbolPaths.mediaLibraryDisabledIcon, height: 20, width: 20);
  static const AppSvgAsset moreDisabledIcon = AppSvgAsset(SymbolPaths.moreDisabledIcon, height: 24, width: 24);
}
