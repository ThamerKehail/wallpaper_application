import 'package:flutter/cupertino.dart';
import 'package:wallpoper_app/shares/local/sqdlite.dart';

class FavoriteViewModel extends ChangeNotifier {
  final dbHelper = DatabaseHelper();
  dynamic? favorites;
  void getFavorites() async {
    favorites = await dbHelper.getFavorites();
    notifyListeners();
    print(favorites![0]['imageUrl']);
  }
}
