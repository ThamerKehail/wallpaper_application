import 'package:flutter/cupertino.dart';
import 'package:wallpoper_app/data/get_wallpaper.dart';
import 'package:wallpoper_app/data/search_wallpaper.dart';
import 'package:wallpoper_app/model/photo_model.dart';

class HomeViewModel extends ChangeNotifier {
  TextEditingController search = TextEditingController();
  Future<List<PhotoModel>> getWallpaper() async {
    List<PhotoModel> data = await GetWallpaper().getWallpaper();
    print(data);
    return data;
  }

  Future<List<PhotoModel>> getSearchWallpaper() async {
    List<PhotoModel> data =
        await SearchWallpaper().searchWallpaper(query: search.text);
    print(data);
    notifyListeners();

    return data;
  }
}
