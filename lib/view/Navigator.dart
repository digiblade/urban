import 'package:flutter/material.dart';
import '../view/offer/Offers.dart';
import '../view/settings/Settings.dart';
import 'home/Home.dart';
import 'home/SubCategory.dart';
import 'order/Orders.dart';

class NavigatorPage extends StatefulWidget {
  NavigatorPage({Key key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  Widget page = HomePage();
  int index = 0;
  int data = 0;
  dynamic subData;
  String pageName = "Home";
  setIndex(int ind) {
    setState(() {
      index = ind;
      data = 0;
      pageName = pageNameController(ind);
    });
  }

  String pageNameController(int ind) {
    switch (ind) {
      case 0:
        return "Home";
      case 1:
        return "Category";
      case 2:
        return "Offers";
      case 3:
        return "Orders";
      case 4:
        return "Settings";

      default:
        return "null";
    }
  }

  Widget homePageController(int ind, dynamic dim, dynamic subDim) {
    if (ind == 0) {
      switch (dim) {
        case 0:
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 5),
            child: HomePage(changePage: changeController),
          );

        case 1:
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 5),
            child: SubCategory(categoryId: subDim),
          );

        default:
          return Text("null");
      }
    } else {
      return Text("null");
    }
  }

  changeController(dynamic subId, dynamic newSubData) {
    setState(() {
      data = subId;
      subData = newSubData;
    });
  }

  Widget pageController(int ind) {
    switch (ind) {
      case 0:
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 5),
          child: homePageController(ind, data, subData),
        );
      case 1:
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 5),
          child: Center(
            child: Text("category"),
          ),
        );
      case 2:
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 5),
          child: OffersPage(),
        );
      case 3:
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 5),
          child: OrdersPage(),
        );
      case 4:
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 5),
          child: Setting(),
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
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff040077),
        currentIndex: index,
        onTap: setIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: "Home",
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon: Icon(
              Icons.category_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Offer",
            icon: Icon(
              Icons.local_offer_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Bookings",
            icon: Icon(
              Icons.bookmark_border_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
