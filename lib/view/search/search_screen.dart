import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpoper_app/view/home/home_view_model.dart';
import 'package:wallpoper_app/widget/image_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeModel = context.watch<HomeViewModel>();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: homeModel.getSearchWallpaper(),
            builder: (context, snapshot) {
              return Column(
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
                              homeModel.getSearchWallpaper();
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  snapshot.hasData
                      ? Expanded(
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
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ],
              );
            }),
      ),
    );
  }
}
