import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpoper_app/view/home/home_view_model.dart';
import 'package:wallpoper_app/view/image_details/image_details.dart';
import 'package:wallpoper_app/view/search/search_screen.dart';
import 'package:wallpoper_app/widget/image_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeModel = context.watch<HomeViewModel>();
    return FutureBuilder(
        future: homeModel.getWallpaper(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: homeModel.search,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: ("Search your wallpaper"),
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                homeModel.search.text.isNotEmpty
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SearchScreen()))
                                    : null;
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
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
        });
  }
}
