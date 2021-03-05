import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:urban/view/order/ViewOrder.dart';
import '../../component/OrderCard.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    final double pad = MediaQueryData.fromWindow(window).padding.top;
    print(pad);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OrderCard(
              title: "Tiles Fitting",
              subtitle: "Fix my tiles its urgent",
              offerNetworkImage:
                  "https://digiblade.in/urban/assets/offers/1.jpg",
              date: "10/12/2021",
              onClick: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OrderCard(
              title: "My Offer Title",
              subtitle: "10 % off in any product in 24 hrs.",
              offerNetworkImage:
                  "https://digiblade.in/urban/assets/offers/2.jpg",
              onClick: () {
                print("dim");
                viewOrder(context, pad);
              },
              date: "10/12/2021",
            ),
          ),
        ],
      ),
    );
  }

  viewOrder(context, pad) {
    showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      context: this.context,
      builder: (BuildContext context) => ViewOrder(padding: pad),
    );
  }
}
