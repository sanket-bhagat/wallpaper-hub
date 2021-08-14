import 'package:flutter/material.dart';
import 'package:wallpaper_hub/components/my_app_bar.dart';
import 'package:wallpaper_hub/models/category_model.dart';
import 'package:wallpaper_hub/models/wallpaper_model.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wallpaper_hub/components/search_box.dart';
import 'package:wallpaper_hub/components/wallpaper_tile.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  final bool isCategory;
  SearchScreen({required this.searchQuery, required this.isCategory});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CategoryModel> categories = [];
  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = TextEditingController();

  Future<void> getSearchPhotos(String query) async {
    http.Response response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=30'),
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
  void initState() {
    super.initState();
    getSearchPhotos(widget.searchQuery);
    searchController.text = widget.searchQuery;
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
              widget.isCategory
                  ? SizedBox(
                      height: 0.0,
                    )
                  : SearchBox(
                      searchController: searchController,
                      onTap: () {
                        getSearchPhotos(searchController.text);
                      },
                    ),
              SizedBox(
                height: 16,
              ),
              WallpaperTile(
                wallpapers: wallpapers,
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
