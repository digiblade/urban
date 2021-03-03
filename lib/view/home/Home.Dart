import 'package:flutter/material.dart';
import 'package:urban/component/ProductCard.dart';
import 'package:urban/view/home/SubCategory.dart';
import '../../component/WelcomeCard.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: WelcomeCard(
              mentioned: "Hey User,",
              welcomeMsg: "Welcome to our app.",
              msg: "Please feel free to use it anytime.",
              greetings: "Thank you",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Services",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("View All"),
                ),
              ],
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
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SubCategory()));
                },
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
        ],
      ),
    );
  }
}
