class PhotoModel {
  PhotoModel({
    required this.id,
    required this.photographer,
    required this.avgColor,
    required this.src,
    required this.alt,
  });
  late final int id;

  late final String photographer;

  late final String avgColor;
  late final Src src;

  late final String alt;

  PhotoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    photographer = json['photographer'];
    avgColor = json['avg_color'];
    src = Src.fromJson(json['src']);

    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;

    _data['photographer'] = photographer;

    _data['avg_color'] = avgColor;
    _data['src'] = src.toJson();

    _data['alt'] = alt;
    return _data;
  }

  static List<PhotoModel> asListFromJson(List<dynamic> json) {
    var result = <PhotoModel>[];
    for (var item in json) {
      result.add(PhotoModel.fromJson(item));
    }
    return result;
  }
}

class Src {
  Src({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });
  late final String original;
  late final String large2x;
  late final String large;
  late final String medium;
  late final String small;
  late final String portrait;
  late final String landscape;
  late final String tiny;

  Src.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    large2x = json['large2x'];
    large = json['large'];
    medium = json['medium'];
    small = json['small'];
    portrait = json['portrait'];
    landscape = json['landscape'];
    tiny = json['tiny'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['original'] = original;
    _data['large2x'] = large2x;
    _data['large'] = large;
    _data['medium'] = medium;
    _data['small'] = small;
    _data['portrait'] = portrait;
    _data['landscape'] = landscape;
    _data['tiny'] = tiny;
    return _data;
  }
}
