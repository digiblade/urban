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
  String pageName = "Home";
  setIndex(int ind) {
    setState(() {
      index = ind;
      pageName = pageNameController(ind);
    });
  }

  String pageNameController(int ind) {
    switch (ind) {
      case 0:
        return "Home";
      case 1:
        return "Category";
      default:
        return "null";
    }
  }

  Widget pageController(int ind) {
    switch (ind) {
      case 0:
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 5),
          child: Home(),
        );
      case 1:
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 5),
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
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: SafeArea(
        child: pageController(index),
      ),
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
