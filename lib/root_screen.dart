import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RootScreen({super.key, required this.navigationShell});
  List<BottomNavigationBarItem> get _bottomItems => [
    const BottomNavigationBarItem(icon: Icon(Icons.casino), label: "Random"),
    const BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItems,
        currentIndex: navigationShell.currentIndex,
        onTap: (i) => navigationShell.goBranch(
          i,
          initialLocation: i == navigationShell.currentIndex,
        ),
      ),
    );
  }
}
