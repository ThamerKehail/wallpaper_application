import 'package:flutter/cupertino.dart';

import '../../model/ategory_model.dart';

class CategoryViewModel extends ChangeNotifier {
  List<CategoryModel> categories = [
    CategoryModel(
        image:
            'https://th.bing.com/th/id/R.38b38667d672a4d545b10d47ce683e89?rik=LOXTUqzH6jjKCQ&riu=http%3a%2f%2fstudio3.com%2fblog%2fwp-content%2fuploads%2f2015%2f05%2fsteak-potato-restaurant-dinner-food-photography-studio-3.jpg&ehk=blW6ACwhDpa9%2b6aVobLC8FM6MmG0qqpx%2bPsyahCTjO4%3d&risl=&pid=ImgRaw&r=0',
        name: 'Food'),
    CategoryModel(
        image:
            'https://www.freecodecamp.org/news/content/images/2022/02/arnold-francisca-f77Bh3inUpE-unsplash.jpg',
        name: 'Coding'),
    CategoryModel(
        image:
            'https://www.exoticca.com/uk/magazine/wp-content/uploads/2021/06/matterhorn-BLOG-mountains.png',
        name: 'mountains'),
    CategoryModel(
        image:
            'https://res.cloudinary.com/patch-gardens/image/upload/v1626777620/cms/Online%20magazine/Complete%20guide%20to%20Chinese%20money%20plant%20care/16-9_Hero-min.jpg',
        name: 'plants'),
    CategoryModel(
        image:
            'https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*',
        name: 'Car'),
  ];
}
