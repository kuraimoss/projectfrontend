// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class listImage extends StatefulWidget {
  const listImage({super.key});

  @override
  State<listImage> createState() => _listImageState();
}

class _listImageState extends State<listImage> {
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: 5,
        (context, index) => Image.network(
          "https://picsum.photos/id/200/300/300",
          errorBuilder: (context, error, stackTrace) => Text("404"),
        ),
      ),
    );
  }
}
