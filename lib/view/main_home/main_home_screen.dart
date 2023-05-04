import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpoper_app/view/main_home/main_home_view_model.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainHome = context.watch<MainHomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wally",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 35,
              color: Colors.white.withOpacity(0.5)),
        ),
        centerTitle: true,
      ),
      body: mainHome.screens[mainHome.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(
          size: 40,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 35,
        ),
        unselectedItemColor: Colors.white,
        currentIndex: mainHome.currentIndex,
        onTap: (int index) {
          mainHome.changeCurrentIndex(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: mainHome.currentIndex == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: ""),
          BottomNavigationBarItem(
              icon: mainHome.currentIndex == 1
                  ? const Icon(Icons.dashboard)
                  : const Icon(Icons.dashboard_outlined),
              label: ""),
          BottomNavigationBarItem(
              icon: mainHome.currentIndex == 2
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_outline),
              label: ""),
        ],
      ),
    );
  }
}
