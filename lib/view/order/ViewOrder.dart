import 'package:flutter/material.dart';
import 'package:urban/Colors.dart';
import 'package:urban/component/Badge.dart';
import 'package:urban/component/Button.dart';

class ViewOrder extends StatelessWidget {
  final double padding;
  const ViewOrder({
    Key key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Scaffold(
        appBar: AppBar(title: Text("View Order")),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Image.network(
                          "https://digiblade.in/urban/assets/offers/2.jpg",
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          width: 100,
                          child: Badge(
                            // width: 32,
                            badgeColor: Pending_color,
                            badgeText: "Pending",
                          ),
                        ),
                        trailing: Text("10/12/2020"),
                      ),
                      Text(
                        "Order Category",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Order Subcategory",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Note:- kdfdm fksdkmd sfmdsk mfdslm fldf",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(
                            0.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Address:- kdfdm fksdkmd sfmdsk mfdslm fldf",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(
                            0.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Button1(
                  onPressed: () {},
                  color: Primary_color,
                  text: "Cancel Booking",
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
