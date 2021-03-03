import 'package:flutter/material.dart';
import 'package:urban/component/ProductCard.dart';

class SubCategory extends StatefulWidget {
  SubCategory({Key key}) : super(key: key);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          ProductCard(
            onClick: () {},
            imageUrl: "https://digiblade.in/urban/assets/product/tiles.jpg",
            productName: "Tiles",
          ),
          ProductCard(
            onClick: () {},
            imageUrl: "https://digiblade.in/urban/assets/product/tiles.jpg",
            productName: "Tiles",
          ),
          ProductCard(
            onClick: () {},
            imageUrl: "https://digiblade.in/urban/assets/product/tiles.jpg",
            productName: "Tiles",
          ),
          ProductCard(
            onClick: () {},
            imageUrl: "https://digiblade.in/urban/assets/product/tiles.jpg",
            productName: "Tiles",
          ),
          ProductCard(
            onClick: () {},
            imageUrl: "https://digiblade.in/urban/assets/product/tiles.jpg",
            productName: "Tiles",
          ),
          ProductCard(
            onClick: () {},
            imageUrl: "https://digiblade.in/urban/assets/product/tiles.jpg",
            productName: "Tiles",
          ),
        ],
      ),
    );
  }
}
