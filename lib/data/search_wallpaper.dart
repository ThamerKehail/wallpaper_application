import 'dart:convert';

import 'package:wallpoper_app/model/photo_model.dart';
import 'package:http/http.dart' as http;

class SearchWallpaper {
  Future<List<PhotoModel>> searchWallpaper({required String query}) async {
    final Uri url = Uri.parse("https://api.pexels.com/v1/search?query=$query");
    http.Response response = await http.get(url, headers: {
      'Authorization':
          'NlKhmnnHF05YYXnfQGB5bkhDkzxunSLDDDGxWNN3VYRDcydvwvO8bXla'
    });
    final responseData = await jsonDecode(response.body);
    var data = PhotoModel.asListFromJson(responseData['photos']);

    return data;
  }
}
