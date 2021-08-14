import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/components/category_tile.dart';
import 'package:wallpaper_hub/components/my_app_bar.dart';
import 'package:wallpaper_hub/models/category_model.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_hub/models/wallpaper_model.dart';
import 'dart:convert';
import 'package:wallpaper_hub/components/wallpaper_tile.dart';
import 'package:wallpaper_hub/components/search_box.dart';
import 'package:wallpaper_hub/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = TextEditingController();

  Future<void> getTrendingPhotos() async {
    http.Response response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=30'),
        headers: {
          'Authorization': apiKey,
        });
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel(
        photographer: element['photographer'],
        photographer_url: element['photographer_url'],
        photographer_id: element['photographer_id'],
        original: element['src']['original'],
        portrait: element['src']['portrait'],
        small: element['src']['small'],
      );
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getTrendingPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MyAppBar(),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SearchBox(
                  searchController: searchController,
                  onTap: () async {
                    print(searchController.text);
                    if (searchController.text.length > 0) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                            searchQuery: searchController.text,
                            isCategory: false,
                          ),
                        ),
                      );
                      searchController.clear();
                    }
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        category: categories[index].category,
                        imgUrl: categories[index].imgUrl,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                WallpaperTile(
                  wallpapers: wallpapers,
                  context: context,
                )
              ],
            ),
          ),
        ));
  }
}
