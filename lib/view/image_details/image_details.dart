import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:wallpoper_app/model/photo_model.dart';
import 'package:wallpoper_app/shares/local/sqdlite.dart';
import 'package:wallpoper_app/utils/color.dart';
import 'package:wallpoper_app/view/image_details/image_details_view_model.dart';

class ImageDetails extends StatefulWidget {
  final String photo;
  final int id;
  const ImageDetails({Key? key, required this.photo, required this.id})
      : super(key: key);

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  @override
  void initState() {
    Future.microtask(
        () => context.read<ImagesDetailsViewModel>().getFavorites());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageDetails = context.watch<ImagesDetailsViewModel>();
    bool itemExists = imageDetails.favorites
        .contains({'id': '$widget.id', 'imageUrl': widget.photo});
    if (itemExists) {
      print('Item exists in the list');
    } else {
      print('Item does not exist in the list');
    }
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              widget.photo,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    int data;
                    data = await DatabaseHelper().insertFavorite(
                        {'id': widget.id, 'imageUrl': widget.photo});

                    print("**********************");
                    print(data ?? "null");
                    print("**********************");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(data == 0
                            ? "Already add to favorite"
                            : "Add to wishlist")));
                    // imageDetails.addWishItem(photoModel: photo);
                  },
                  child: Container(
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
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    await GallerySaver.saveImage(widget.photo).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Download success!")));
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.black,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
