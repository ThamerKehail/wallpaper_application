import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpoper_app/view/category_details/category_details_view_model.dart';

import '../../widget/image_card.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String title;
  const CategoryDetailsScreen({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryDetails = context.watch<CategoryDetailsViewModel>();
    return Scaffold(
      body: FutureBuilder(
          future: categoryDetails.getWallpaper(query: title),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Column(
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   padding: const EdgeInsets.symmetric(horizontal: 15),
                      //   margin: const EdgeInsets.symmetric(horizontal: 15),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: TextField(
                      //           controller: categoryDetails.search,
                      //           style: const TextStyle(color: Colors.white),
                      //           decoration: const InputDecoration(
                      //             hintText: ("Search your wallpaper"),
                      //             hintStyle: TextStyle(
                      //               color: Colors.white,
                      //             ),
                      //             border: InputBorder.none,
                      //           ),
                      //         ),
                      //       ),
                      //       IconButton(
                      //           onPressed: () {
                      //             homeModel.search.text.isNotEmpty
                      //                 ? Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (_) =>
                      //                     const SearchScreen()))
                      //                 : null;
                      //           },
                      //           icon: const Icon(
                      //             Icons.search,
                      //             color: Colors.white,
                      //           )),
                      //     ],
                      //   ),
                      // ),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4 / 3,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ImageCard(
                                photo: snapshot.data![index].src.portrait,
                                id: snapshot.data![index].id,
                              );
                            }),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
