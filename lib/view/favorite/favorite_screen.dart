import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpoper_app/view/favorite/favorite_view_model.dart';
import 'package:wallpoper_app/view/image_details/image_details_view_model.dart';

import '../../shares/local/sqdlite.dart';
import '../../widget/favorite_image_card.dart';
import '../../widget/image_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<FavoriteViewModel>().getFavorites());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favorite = context.watch<FavoriteViewModel>();
    return favorite.favorites == null
        ? SizedBox()
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4 / 3,
              mainAxisSpacing: 30,
            ),
            itemCount: favorite.favorites.length,
            itemBuilder: (context, index) {
              return FavoriteImageCard(
                photo: favorite.favorites[index]['imageUrl'],
                id: favorite.favorites[index]['id'],
              );
            });
  }
}
