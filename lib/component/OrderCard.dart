import 'package:flutter/material.dart';
import 'package:urban/Colors.dart';
import 'package:urban/component/Badge.dart';

class OrderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String offerNetworkImage;
  final String date;
  final Function onClick;
  const OrderCard({
    Key key,
    this.title,
    this.subtitle,
    this.offerNetworkImage,
    this.onClick,
    this.date = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Badge(
                    badgeColor: Success_color,
                    textColor: Colors.white,
                    badgeText: "Success",
                    size: 16,
                  )),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(date),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
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
          ],
        ),
      ),
    );
  }
}
