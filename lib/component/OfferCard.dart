import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String offerNetworkImage;
  final Function onClick;
  const OfferCard({
    Key key,
    this.title,
    this.subtitle,
    this.offerNetworkImage,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (onClick != null) ? onClick : () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            isThreeLine: true,
            title: Text(title),
            subtitle: Text(subtitle),
            leading: Image.network(
              offerNetworkImage,
            ),
          ),
        ),
      ),
    );
  }
}
