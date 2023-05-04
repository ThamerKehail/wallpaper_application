import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpoper_app/model/photo_model.dart';
import 'package:wallpoper_app/shares/local/sqdlite.dart';
import 'package:wallpoper_app/view/favorite/favorite_view_model.dart';

import '../utils/color.dart';
import '../view/image_details/image_details.dart';

class FavoriteImageCard extends StatelessWidget {
  final String photo;
  final int id;
  const FavoriteImageCard({Key? key, required this.photo, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorite = context.watch<FavoriteViewModel>();
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ImageDetails(
                      photo: photo,
                      id: id,
                    )));
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 500,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Image.network(
              photo,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            onTap: () async {
              await DatabaseHelper().deleteFavorite(id);
              favorite.getFavorites();
            },
            child: Container(
              margin: EdgeInsets.all(12),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.black,
              ),
              child: const Center(
                child: Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
