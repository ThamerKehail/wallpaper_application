import 'dart:convert';

import '../model/photo_model.dart';
import 'package:http/http.dart' as http;

class GetWallpaper {
  Future<List<PhotoModel>> getWallpaper() async {
    print("Get image wallaper");
    final Uri url = Uri.parse("https://api.pexels.com/v1/curated");
    http.Response response = await http.get(url, headers: {
      'Authorization':
          'NlKhmnnHF05YYXnfQGB5bkhDkzxunSLDDDGxWNN3VYRDcydvwvO8bXla',
      'Cookie':
          '__cf_bm=jSWOqQMM8Rtz6AlaTSr5Da5gAqNQ5v3Y.l_OhsCrb5c-1683193017-0-AXFWqnV569wRVZtW7iLjTElwJ62eMIWxComMx55A1FAwQqI1zZI3g3pJqqI02VULZcVWCrpTWytGoPBCi75hbKk='
    });
    print(response.statusCode);
    final responseData = await jsonDecode(response.body);
    var data = PhotoModel.asListFromJson(responseData['photos']);
    print(data);

    return data;
  }
}
