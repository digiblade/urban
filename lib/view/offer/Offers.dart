import 'package:flutter/material.dart';
import 'package:urban/component/OfferCard.dart';

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OfferCard(
              title: "My Offer Title",
              subtitle: "10 % off in any product in 24 hrs.",
              offerNetworkImage:
                  "https://digiblade.in/urban/assets/offers/1.jpg",
              onClick: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OfferCard(
              title: "My Offer Title",
              subtitle: "10 % off in any product in 24 hrs.",
              offerNetworkImage:
                  "https://digiblade.in/urban/assets/offers/1.jpg",
              onClick: () {},
            ),
          ),
        ],
      ),
    );
  }
}
