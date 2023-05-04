import 'package:flutter/material.dart';
import 'package:wallpoper_app/model/photo_model.dart';

import '../../shares/local/sqdlite.dart';

class ImagesDetailsViewModel extends ChangeNotifier {
  Map<String, PhotoModel> _itemWishlist = {};
  Map<String, PhotoModel> get itemWishlist {
    return {..._itemWishlist};
  }

  void addWishItem({
    required PhotoModel photoModel,
  }) {
    _itemWishlist.putIfAbsent(
        photoModel.id.toString(),
        () => PhotoModel(
              id: photoModel.id,
              photographer: photoModel.photographer,
              avgColor: photoModel.avgColor,
              src: photoModel.src,
              alt: photoModel.alt,
            ));
    print(_itemWishlist);
    notifyListeners();
  }

  final dbHelper = DatabaseHelper();
  dynamic? favorites;
  void getFavorites() async {
    favorites = await dbHelper.getFavorites();
    notifyListeners();
    print(favorites![0]['imageUrl']);
  }
}
