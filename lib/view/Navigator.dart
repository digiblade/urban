import 'package:flutter/material.dart';
import './home/Home.dart';

class NavigatorPage extends StatefulWidget {
  NavigatorPage({Key key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  Widget page = Home();
  int index = 0;
  setIndex(int ind) {
    setState(() {
      index = ind;
    });
  }

  Widget pageController(int ind) {
    switch (ind) {
      case 0:
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          child: Home(),
        );
      case 1:
        return AnimatedSwitcher(
          duration: Duration(seconds: 100),
          child: Center(
            child: Text("category"),
          ),
        );
      default:
        return Text("null");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageController(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: setIndex,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon: Icon(
              Icons.category,
            ),
          ),
        ],
      ),
    );
  }
}
