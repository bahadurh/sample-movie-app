import 'package:flutter/material.dart';
import 'package:tentwentyassesment/core/app_symbols.dart';

import '../common/widget/navbar.dart';
import 'movies/presentation/views/movie_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> screens = [
    Container(alignment: Alignment.center, child: Text("Dashboard")),
    MovieListView(),
    Container(alignment: Alignment.center, child: Text("Media Library")),
    Container(alignment: Alignment.center, child: Text("More")),
  ];
  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.only(bottom: 10);
    return Scaffold(
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          AppBottomNavBarItem(
            icon: Padding(padding: padding, child: Symbols.dashboardDisabledIcon),
            activeIco: Padding(padding: padding, child: Symbols.dashboardActiveIcon),
            label: "Dashboard",
          ),
          AppBottomNavBarItem(
            icon: Padding(padding: padding, child: Symbols.watchDisabledIcon),
            label: "Watch",
            activeIco: Padding(padding: padding, child: Symbols.watchActiveIcon),
          ),
          AppBottomNavBarItem(
            icon: Padding(padding: padding, child: Symbols.mediaLibraryDisabledIcon),
            activeIco: Padding(padding: padding, child: Symbols.mediaLibraryActiveIcon),
            label: "Media Library",
          ),
          AppBottomNavBarItem(
            icon: Padding(padding: padding, child: Symbols.moreDisabledIcon),
            activeIco: Padding(padding: padding, child: Symbols.moreActiveIcon),
            label: "More",
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
    );
  }
}
