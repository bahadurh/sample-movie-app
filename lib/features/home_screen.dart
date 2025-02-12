import 'package:flutter/material.dart';

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
     MovieListView(),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          AppBottomNavBarItem(icon: Icon(Icons.space_dashboard_outlined), label: "Dashboard"),
          AppBottomNavBarItem(icon: Icon(Icons.play_circle_sharp), label: "Watch"),
          AppBottomNavBarItem(icon: Icon(Icons.library_add_check_outlined), label: "Media Library"),
          AppBottomNavBarItem(icon: Icon(Icons.more_horiz_outlined), label: "More"),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
    );
  }
}
