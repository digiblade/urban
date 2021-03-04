import 'package:flutter/material.dart';
import '../../component/OrderCard.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OrderCard(
              title: "My Offer Title",
              subtitle: "10 % off in any product in 24 hrs.",
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
                  "https://digiblade.in/urban/assets/offers/1.jpg",
              onClick: () {},
              date: "10/12/2021",
            ),
          ),
        ],
      ),
    );
  }
}
