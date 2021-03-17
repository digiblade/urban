import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:urban/model/Categorymodel.dart';
import '../../component/ProductCard.dart';
import '../../view/home/BookingForm.dart';
import 'dart:ui';

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
    final double pad = MediaQueryData.fromWindow(window).padding.top;
    print(pad);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(
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
            FutureBuilder(
              future: getSubCategory(widget.categoryId),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<SubCategoryData> data = snapshot.data;
                  if (data.length > 0) {
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: data.map((e) {
                        return ProductCard(
                          onClick: () {
                            bookingForm(context, pad);
                          },
                          imageUrl: e.imagePath,
                          productName: e.name,
                        );
                      }).toList(),
                    );
                  } else {
                    return Center(
                      child: Text("No Sub Category Found"),
                    );
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bookingForm(context, pad) {
    showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      context: this.context,
      builder: (BuildContext context) => BookingForm(padding: pad),
    );
  }
}
