import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController searchController;
  final Function onTap;

  SearchBox({required this.searchController, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff5f8fd),
        borderRadius: BorderRadius.circular(24.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: false,
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap();
              print('tapped');
            },
            child: Container(
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
