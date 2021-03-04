import 'package:flutter/material.dart';

class OffersPage extends StatefulWidget {
  OffersPage({Key key}) : super(key: key);

  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading:
                Image.network("https://digiblade.in/urban/assets/offers/1.jpg"),
          )
        ],
      ),
    );
  }
}
