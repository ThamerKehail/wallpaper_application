import 'package:flutter/cupertino.dart';
import 'package:wallpoper_app/view/category/category_screen.dart';
import 'package:wallpoper_app/view/favorite/favorite_screen.dart';
import 'package:wallpoper_app/view/home/home_screen.dart';

class MainHomeViewModel extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
  ];

  changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
