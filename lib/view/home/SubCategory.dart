import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:urban/component/ProductCard.dart';

class SubCategory extends StatefulWidget {
  final dynamic categoryId;
  SubCategory({
    Key key,
    this.categoryId,
  }) : super(key: key);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Subcategory",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.count(
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
                productName: widget.categoryId.toString(),
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
        ],
      ),
    );
  }
}
