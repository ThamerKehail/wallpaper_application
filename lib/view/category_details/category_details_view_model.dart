import 'package:flutter/cupertino.dart';

import '../../data/search_wallpaper.dart';
import '../../model/photo_model.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  Future<List<PhotoModel>> getWallpaper({required String query}) async {
    List<PhotoModel> data =
        await SearchWallpaper().searchWallpaper(query: query);
    print(data);
    notifyListeners();

    return data;
  }
}
