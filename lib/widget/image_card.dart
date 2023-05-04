import 'package:flutter/material.dart';
import 'package:wallpoper_app/model/photo_model.dart';

import '../view/image_details/image_details.dart';

class ImageCard extends StatelessWidget {
  final String photo;
  final int id;
  const ImageCard({Key? key, required this.photo, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Container(
        margin: const EdgeInsets.all(10),
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
    );
  }
}
