import 'package:flutter/material.dart';
import 'package:urban/model/Categorymodel.dart';
import '../../component/ProductCard.dart';
import '../../component/WelcomeCard.dart';

class HomePage extends StatelessWidget {
  final Function changePage;
  HomePage({Key key, this.changePage}) : super(key: key);
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
          FutureBuilder(
            future: getCategory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Category> data = snapshot.data;
                if (data.length > 0) {
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: data.map((category) {
                      return ProductCard(
                        onClick: () {
                          changePage(1, category.postid);
                        },
                        imageUrl: category.imagePath,
                        productName: category.name,
                      );
                    }).toList(),
                  );
                } else {
                  return Center(
                    child: Text("No Category found"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
