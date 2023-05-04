import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpoper_app/utils/color.dart';
import 'package:wallpoper_app/view/category/category_view_model.dart';
import 'package:wallpoper_app/view/category_details/category_details_view_model.dart';
import 'package:wallpoper_app/view/favorite/favorite_view_model.dart';
import 'package:wallpoper_app/view/home/home_view_model.dart';
import 'package:wallpoper_app/view/image_details/image_details_view_model.dart';
import 'package:wallpoper_app/view/main_home/main_home_screen.dart';
import 'package:wallpoper_app/view/main_home/main_home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainHomeViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ImagesDetailsViewModel()),
        ChangeNotifierProvider(create: (_) => FavoriteViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryDetailsViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: AppColor.black,
            appBarTheme: const AppBarTheme(
              color: AppColor.black,
              elevation: 0.0,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
            )),
        home: const MainHomeScreen(),
      ),
    );
  }
}
