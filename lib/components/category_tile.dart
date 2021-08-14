import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaper_hub/screens/search_screen.dart';

class CategoryTile extends StatelessWidget {
  final String imgUrl, category;
  CategoryTile({
    required this.category,
    required this.imgUrl,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchScreen(
              searchQuery: category,
              isCategory: true,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 50.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Text(
                category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              width: 100.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black26.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
